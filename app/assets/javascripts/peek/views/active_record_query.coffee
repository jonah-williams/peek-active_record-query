$(document).on 'peek:render', (event, requestId, data) ->
  window.active_record_query =
    queries: data.context['active-record-query'].queries

  if console? and console.table?
    console.table window.active_record_query.queries
