import * as React from 'react'
import * as ReactDOM from 'react-dom'
import { QueryClient, QueryClientProvider } from 'react-query'

import { Purchases } from './Purchases'

ReactDOM.render(
  <QueryClientProvider client={new QueryClient()}>
    <Purchases />
  </QueryClientProvider>,
  document.getElementById("root")
);
