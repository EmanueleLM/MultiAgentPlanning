(define (domain meeting_planning_example11)
  (:requirements :strips :typing)
  (:types location timepoint)
  (:predicates
    (at ?loc - location ?t - timepoint)
    (carol_present ?t - timepoint)
    (met_carol)
  )

  ;; Concrete travel action: depart nobhill at t1335, arrive sunset at t1400.
  ;; Preconditions require the traveler to be at nobhill at departure time.
  ;; Effects place the traveler at sunset at the arrival timepoint and remove the
  ;; departure-time presence to avoid claiming presence at two places at once.
  (:action travel_nobhill_1335_to_sunset_1400
    :parameters ()
    :precondition (at nobhill t1335)
    :effect (and
      (not (at nobhill t1335))
      (at sunset t1400)
      (not (at nobhill t1400))
      (not (at sunset t1335))
    )
  )

  ;; Concrete meeting action: continuous meeting from t1400 to t1515 (75 minutes).
  ;; Preconditions require traveler present at sunset at meeting start and Carol present
  ;; at both endpoints of the required continuous interval (models availability).
  ;; Effect records that the required meeting with Carol has occurred and ensures
  ;; traveler presence at sunset at the meeting end timepoint.
  (:action meet_carol_1400_1515
    :parameters ()
    :precondition (and
      (at sunset t1400)
      (carol_present t1400)
      (carol_present t1515)
    )
    :effect (and
      (met_carol)
      (at sunset t1515)
    )
  )
)