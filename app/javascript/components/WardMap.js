import React, { Component } from 'react'
import PropTypes from 'prop-types'
import { compose, withProps } from 'recompose'
import {
  withScriptjs,
  withGoogleMap,
  GoogleMap,
  KmlLayer,
  Polygon
} from 'react-google-maps'
import SelectedFeatureWindow from './SelectedFeatureWindow'
import FeedbackModal from './FeedbackModal'
import fetch from 'cross-fetch';

var worldCoords = [
  { lat: -85.1054596961173, lng: -180 },
  { lat: 85.1054596961173, lng: -180 },
  { lat: 85.1054596961173, lng: 180 },
  { lat: -85.1054596961173, lng: 180 },
  { lat: -85.1054596961173, lng: 0 }
].reverse()

class WardMap extends Component {
  state = { selectedFeature: null, showFeedbackModal: false }

  onLayerClick(layer, kmlEvent) {
    this.setState({
      selectedFeature: {
        layerId: layer.id,
        kmlEvent
      }
    })
  }

  render() {
    const { selectedFeature, showFeedbackModal } = this.state
    const { ward, visibleLayers } = this.props

    return (
      <React.Fragment>
        <FeedbackModal
          selectedFeature={selectedFeature}
          visible={showFeedbackModal}
          onClose={() => this.setState({ showFeedbackModal: false })}
          key={Date.now()} // Recreate modal state each time we open it
        />
        <GoogleMap
          defaultZoom={12}
          defaultCenter={{ lat: 55.9222, lng: -4.8169 }}
        >
          <SelectedFeatureWindow
            selectedFeature={selectedFeature}
            onClose={() => this.setState({ selectedFeature: null })}
            onLeaveFeedback={() => this.setState({ showFeedbackModal: true })}
          />
          {visibleLayers.map(({ value }) => (
            <KmlLayer
              key={ward.layers[value].id}
              url={ward.layers[value].kml_url}
              options={{ preserveViewport: true, suppressInfoWindows: true }}
              onClick={kmlEvent => {
                const layer = ward.layers[value]
                this.onLayerClick(layer, kmlEvent)
              }}
            />
          ))}
          {ward.outline_coordinates && (
            <Polygon paths={[worldCoords, ward.outline_coordinates]} />
          )}
        </GoogleMap>
      </React.Fragment>
    )
  }
}

const ComposedWardMap = compose(
  withProps({
    googleMapURL:
      'https://maps.googleapis.com/maps/api/js?key=AIzaSyCKf-G2P7dNBdD_pTI2Sb9XHIdh8Qifz7E&v=3.exp&libraries=geometry,drawing,places',
    loadingElement: <div style={{ height: `100%` }} />,
    containerElement: <div style={{ height: `600px` }} />,
    mapElement: <div style={{ height: `100%` }} />
  }),
  withScriptjs,
  withGoogleMap
)(WardMap)

ComposedWardMap.propTypes = {
  name: PropTypes.string
}

export default ComposedWardMap
