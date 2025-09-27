(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    traveler barbara - person
    Bayview GoldenGatePark - location
  )
  (:init
    ;; Barbara is at GoldenGatePark from 08:00 (480) until 11:30 (690)
    (at 480 (at barbara GoldenGatePark))
    (at 690 (not (at barbara GoldenGatePark)))

    ;; Traveler arrives at Bayview at 09:00 (540)
    (at 540 (at traveler Bayview))
  )
  (:goal (met traveler barbara))
)