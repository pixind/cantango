module CanTango
  class Ability
    class Cache
      class Writer
        attr_reader :cache

        def initialize cache
          @cache = cache
        end

        def save key, rules
          cache.invalidate!
          cache.rules_cache.save cache.key, prepared_rules
          session[:cache_key] = cache.key if session
        end

        protected

        def prepared_rules
          cache.compile_on? ? compiler.compile!(rules) : rules
        end

        def rules
          return cache.cached_rules if cache.cached_rules?
          cache.ability.send :rules # bad!? FIXME
        end

        def compiler
          cache.compiler
        end

        def session
          cache.session
        end

        def rules_cache
          cache.rules_cache
        end
      end
    end
  end
end
