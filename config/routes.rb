LostSql::Application.routes.draw do
  scope defaults: { format: :json } do
    root 'api#index'

    get 'uuids'      => 'uuids#create', as: 'uuid'
    get 'uuids/:num' => 'uuids#create', as: 'uuids'

    scope :articles do
      get    ''     => 'articles#index', as: 'articles'
      get    ':ids' => 'articles#index', as: 'article'
      put    ':id'  => 'articles#create_or_replace'
      patch  ':id'  => 'articles#update'
      delete ':id'  => 'articles#destroy'
    end

    scope :comments do
      get    ''     => 'comments#index', as: 'comments'
      get    ':ids' => 'comments#index', as: 'comment'
      put    ':id'  => 'comments#create_or_replace'
      patch  ':id'  => 'comments#update'
      delete ':id'  => 'comments#destroy'
    end

    scope :duties do
      get    ''     => 'duties#index', as: 'duties'
      get    ':ids' => 'duties#index', as: 'duty'
      put    ':id'  => 'duties#create_or_replace'
      patch  ':id'  => 'duties#update'
      delete ':id'  => 'duties#destroy'
    end

    scope :jobs do
      get    ''     => 'jobs#index', as: 'jobs'
      get    ':ids' => 'jobs#index', as: 'job'
      put    ':id'  => 'jobs#create_or_replace'
      patch  ':id'  => 'jobs#update'
      delete ':id'  => 'jobs#destroy'
    end

    scope :tags do
      get    ''     => 'tags#index', as: 'tags'
      get    ':ids' => 'tags#index', as: 'tag'
      put    ':id'  => 'tags#create_or_replace'
      patch  ':id'  => 'tags#update'
      delete ':id'  => 'tags#destroy'
    end

    scope :users do
      get    ''     => 'users#index', as: 'users'
      get    ':ids' => 'users#index', as: 'user'
      put    ':id'  => 'users#create_or_replace'
      patch  ':id'  => 'users#update'
      delete ':id'  => 'users#destroy'
    end
  end
end