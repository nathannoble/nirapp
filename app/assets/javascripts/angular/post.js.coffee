App.factory 'Post', ['$resource', ($resource) ->
  $resource '/api/posts/:id', id: '@id'
]