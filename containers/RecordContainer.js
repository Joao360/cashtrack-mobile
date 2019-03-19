import { connect } from 'react-redux'

import RecordList from '../components/RecordList'

const mapStateToProps = state => ({
  records: state.records
})

export default connect(mapStateToProps)(RecordList)
