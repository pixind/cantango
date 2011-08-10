module CanTango
  class Ability
    module RoleHelpers

      # return list roles the user has
      def roles
        raise "#{subject.inspect} should have a #{roles_list_meth} method" if !subject.respond_to?(roles_list_meth)
        subj_roles = subject.send(roles_list_meth)
        return [] if subj_roles.blank?
        subj_roles.flatten
      end

      # return list of symbols for role groups the user belongs to
      def role_groups
        raise "#{subject.inspect} should have a #{role_groups_list_meth} method" if !subject.respond_to?(role_groups_list_meth)
        subj_role_groups = subject.send(role_groups_list_meth)
       return [] if subj_role_groups.blank?
        subj_role_groups.flatten
      end

      def role_groups_list_meth
        CanTango.config.role_groups.list_method
      end

      def roles_list_meth
        CanTango.config.roles.list_method
      end

      def has_role_meth
        CanTango.config.roles.list_method
      end

      def has_role_group_meth
        CanTango.config.role_groups.has_method
      end
    end
  end
end
