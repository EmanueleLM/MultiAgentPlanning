(define (problem combined-meet-john)
  (:domain combined-meet-scheduling)
  (:objects
    visitor john - person
    golden-gate-park pacific-heights - location
  )

  (:init
    ;; Both start at Golden Gate Park at 9:00 AM = 540 minutes
    (at visitor golden-gate-park)
    (at john golden-gate-park)
    (= (time) 540)

    ;; Travel times (explicit so travel actions are usable)
    (= (travel-time golden-gate-park pacific-heights) 16)
    (= (travel-time pacific-heights golden-gate-park) 15)

    ;; John's known presence window at Pacific Heights: 7:45 PM to 8:45 PM
    (= (person-available-start john) 1185)
    (= (person-available-end john) 1285)
  )

  ;; Goal requires both that the meeting occurred and John was available for it,
  ;; which forces the planner to schedule both the visitor-meet-john and john-be-available
  ;; (thus modeling the two agents' distinct commitments and ensuring overlap).
  (:goal (and
    (met visitor john)
    (available-for-meeting)
  ))

  ;; Optimize finishing time (earliest finish)
  (:metric minimize (time))
)