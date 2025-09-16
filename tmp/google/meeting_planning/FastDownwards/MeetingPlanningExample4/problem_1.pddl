(define (problem marina-integrated-discretized)
  (:domain integrated-meeting-discretized)
  (:objects
     Presidio MarinaDistrict - location
     visitor jessica - person
  )

  (:init
     (at visitor MarinaDistrict)
     (at jessica Presidio)
     (time-at t0)
  )

  (:goal (met visitor jessica))
)