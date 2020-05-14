module ApplicationHelper
    def flash_class(type)
        case type
          when 'notice' then 'alert alert-success alert-dismissible fade show'
          when 'success' then 'alert alert-success alert-dismissible fade show'
          when 'alert' then 'alert alert-danger alert-dismissible fade show'
          when 'danger' then 'alert alert-danger alert-dismissible fade show'
          when 'error' then 'alert alert-danger alert-dismissible fade show'
        end
      end
end
