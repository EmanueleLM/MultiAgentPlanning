(define (problem meet-john-problem)
  (:domain meeting-scheduler)
  (:objects
    richmond-district north-beach - location
    you john - person
    t540 t557 t615 t630 t645 t700 t715 t730 t745 - time
  )
  (:init
    (at-location you richmond-district)
    (john-at-location north-beach)
    (time-is t540)
    (can-meet-at t615)
    (can-meet-at t630)
    (can-meet-at t645)
    (can-meet-at t700)
    (can-meet-at t715)
    (can-meet-at t730)
    (can-meet-at t745)
  )
  (:goal
    (meeting-scheduled)
  )
)