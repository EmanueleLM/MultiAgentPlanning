(define (domain combined-meet-scheduling-classical)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person location timepoint)

  (:predicates
    (at ?p - person ?l - location)
    (met ?a - person ?b - person)
    (available-for-meeting)
    (curtime ?t - timepoint)
    (person-available-start ?p - person ?t - timepoint)
  )

  ;; Visitor-specific travel (instantaneous symbolic action)
  (:action travel-visitor
    :parameters (?from - location ?to - location)
    :precondition (and (at visitor ?from) (curtime s0))
    :effect (and
      (not (at visitor ?from))
      (at visitor ?to)
    )
    :cost 0
  )

  ;; John-specific travel (instantaneous symbolic action)
  (:action travel-john
    :parameters (?from - location ?to - location)
    :precondition (and (at john ?from) (curtime s0))
    :effect (and
      (not (at john ?from))
      (at john ?to)
    )
    :cost 0
  )

  ;; Advance symbolic time from start to the candidate meeting start S1 (1185)
  (:action advance-to-s1
    :precondition (curtime s0)
    :effect (and (not (curtime s0)) (curtime s1))
    :cost 0
  )

  ;; Advance symbolic time from S1 to S2 (1200)
  (:action advance-to-s2
    :precondition (curtime s1)
    :effect (and (not (curtime s1)) (curtime s2))
    :cost 0
  )

  ;; Advance symbolic time from S2 to S3 (1240)
  (:action advance-to-s3
    :precondition (curtime s2)
    :effect (and (not (curtime s2)) (curtime s3))
    :cost 0
  )

  ;; John commits to being available at specific symbolic start times (keeps actions distinct)
  (:action john-commit-available-s1
    :precondition (and (at john pacific-heights) (curtime s1) (person-available-start john s1))
    :effect (available-for-meeting)
    :cost 0
  )

  (:action john-commit-available-s2
    :precondition (and (at john pacific-heights) (curtime s2) (person-available-start john s2))
    :effect (available-for-meeting)
    :cost 0
  )

  (:action john-commit-available-s3
    :precondition (and (at john pacific-heights) (curtime s3) (person-available-start john s3))
    :effect (available-for-meeting)
    :cost 0
  )

  ;; Visitor performs the 45-minute meeting at the chosen symbolic start time.
  ;; Each meeting action carries a cost equal to the numeric meeting end time so the planner
  ;; can minimize finish time via :action-costs (visitor actions kept distinct).
  (:action visitor-meet-john-s1
    :precondition (and
      (at visitor pacific-heights)
      (at john pacific-heights)
      (curtime s1)
      (available-for-meeting)
    )
    :effect (met visitor john)
    :cost 1230
  )

  (:action visitor-meet-john-s2
    :precondition (and
      (at visitor pacific-heights)
      (at john pacific-heights)
      (curtime s2)
      (available-for-meeting)
    )
    :effect (met visitor john)
    :cost 1245
  )

  (:action visitor-meet-john-s3
    :precondition (and
      (at visitor pacific-heights)
      (at john pacific-heights)
      (curtime s3)
      (available-for-meeting)
    )
    :effect (met visitor john)
    :cost 1285
  )
)