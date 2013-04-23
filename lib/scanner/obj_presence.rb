module Yawast
  module Scanner
    class ObjectPresence
      def self.check_all(uri)
        check_path(uri, '.git', true)
        check_path(uri, '.hg', true)
        check_path(uri, '.svn', true)
        check_path(uri, '.bzr', true)
      end

      def self.check_path(uri, path, vuln)
        #note: this only checks directly at the root, I'm not sure if this is what we want
        # should probably be relative to what's passed in, instead of overriding the path.
        uri.path = "/#{path}/"
        code = Yawast::Shared::Http.get_status_code(uri)

        if code == 200
          msg = "'#{path}' Source Control Directory found: #{uri}"

          if vuln
            Yawast::Utilities.puts_vuln msg
          else
            Yawast::Utilities.puts_warn msg
          end

          puts ''
        end
      end
    end
  end
end