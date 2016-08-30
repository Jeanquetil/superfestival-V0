/* global instantsearch */

app({
  appId: ENV_ALGOLIA_ID,
  apiKey: ENV_ALGOLIA_API_KEY,
  indexName: 'Concert',
  urlSync: true
});

// app({
//   appId: 'latency',
//   apiKey: '6be0576ff61c053d5f9a3225e2a90f76',
//   indexName: 'instant_search'
// });

function app(opts) {
  console.log(opts);
  var search = instantsearch({
    appId: opts.appId,
    apiKey: opts.apiKey,
    indexName: opts.indexName,
    urlSync: true
  });
  console.log(search);
  search.addWidget(
    instantsearch.widgets.searchBox({
      container: '#search-input',
      placeholder: 'Search for Concerts'
    })
    );

  search.addWidget(
    instantsearch.widgets.hits({
      container: '#hits',
      hitsPerPage: 8,
      templates: {
        item: getTemplate('hit'),
        empty: getTemplate('no-results')
      },
      render: function(params) {
        var results = params.results;
      }
    })
    );

  search.addWidget(
    instantsearch.widgets.pagination({
      container: '#pagination',
      scrollTo: '#search-input',
      render: function(params) {
        var results = params.results;
      }
    })
    );

  search.addWidget(
    instantsearch.widgets.refinementList({
      container: '#festival_name',
      attributeName: 'festival_name',
      sortBy: ['name:asc', 'count:desc'],
      limit: 5,
      operator: 'or',
      templates: {
        header: '<h5>Festival</h5>'
      },
      render: function(params) {
        var results = params.results;
      }
    })
    );

  search.addWidget(
    instantsearch.widgets.menu({
      container: '#concert_day',
      attributeName: 'concert_day',
      sortBy: ['name:asc', 'count:desc'],
      limit: 5,
      operator: 'or',
      templates: {
        header: '<h5>Concert Day</h5>'
      },
      render: function(params) {
        var results = params.results;
      }
    })
    );

  search.start();
}

function getTemplate(templateName) {
  return document.querySelector('#' + templateName + '-template').innerHTML;
}
