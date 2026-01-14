module Cookstyle
  module Cops
    module Chef
      class DeprecatedExecuteResource < Base
        MSG = 'Avoid using execute resource for package installation. Use package resource instead.'

        def on_block(node)
          return unless node.send_node.method_name == :execute
          add_offense(node.send_node.loc.selector)
        end
      end
    end
  end
end
