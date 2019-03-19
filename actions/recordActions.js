export const ADD_RECORD = 'ADD_RECORD'
export const EDIT_RECORD = 'EDIT_RECORD'
export const DEL_RECORD = 'DEL_RECORD'

export const addRecord = record => (
  { type: ADD_RECORD, record }
)

export const deleteRecord = id => (
  { type: DEL_RECORD, id }
)
