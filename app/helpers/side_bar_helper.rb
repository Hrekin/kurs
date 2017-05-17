module SideBarHelper
  def side_bar_items(ru)
    result = []
    result <<{
      :name => 'Оплата Услуг',
      :icon => 'ruble',
      :controller => :payments, 
      :action => :index
    }
    result <<{
      :name => 'Анкеты',
      :icon => 'list-alt',
      :controller => :worksheets, 
      :action => :index
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'},
    ]} 
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end
