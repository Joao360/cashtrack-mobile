import { createStore } from 'redux'

import reducers from './reducers/index'

const initialState = {
  balance: 185,
  records: [
    {
      id: 1,
      recordType: 'Expense',
      ammount: 20
    },
    {
      id: 2,
      recordType: 'Income',
      ammount: 5
    },
    {
      id: 3,
      recordType: 'Income',
      ammount: 200
    }
  ]
}

const configureStore = () => {
  return createStore(
    reducers,
    initialState,
    window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
  )
}

export default configureStore
