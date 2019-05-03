import React from 'react'
import { InfoWindow } from 'react-google-maps'
import { Button } from 'reactstrap'

export default ({ selectedFeature, onClose, onLeaveFeedback }) => {
  if (selectedFeature == null) {
    return null
  }

  const { kmlEvent } = selectedFeature

  return (
    <InfoWindow position={kmlEvent.latLng} onCloseClick={onClose}>
      <div>
        <h3>{kmlEvent.featureData.name}</h3>
        <p
          dangerouslySetInnerHTML={{ __html: kmlEvent.featureData.description }}
        />
        <Button outline color="primary" onClick={onLeaveFeedback}>
          Leave Feedback
        </Button>
      </div>
    </InfoWindow>
  )
}
