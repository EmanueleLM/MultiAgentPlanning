(define (problem marina-integrated-discretized)
  (:domain integrated-meeting-discretized)
  ;; Using domain constants; no objects section required
  (:init
     (at visitor MarinaDistrict)
     (at jessica Presidio)
     (time-at t0)
  )

  (:goal (met visitor jessica))
)