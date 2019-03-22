import { combineReducers } from 'redux'

import records from './records'
import balance from './balance'

const reducers = combineReducers({
  records,
  balance
})

export default reducers
