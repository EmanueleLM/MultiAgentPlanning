(define (domain combined-meet-scheduling-classical)
  (:requirements :strips :typing)
  (:types person location timepoint)

  (:constants
    visitor john - person
    golden-gate-park pacific-heights - location
    s0 s1 s2 s3 - timepoint
  )

  (:predicates
    (at ?p - person ?l - location)
    (met ?a - person ?b - person)
    (available-for-meeting)
    (curtime ?t - timepoint)
    (person-available-start ?p - person ?t - timepoint)
  )

  (:action travel-visitor
    :parameters (?from - location ?to - location)
    :precondition (and (at visitor ?from) (curtime s0))
    :effect (and
      (not (at visitor ?from))
      (at visitor ?to)
    )
  )

  (:action travel-john
    :parameters (?from - location ?to - location)
    :precondition (and (at john ?from) (curtime s0))
    :effect (and
      (not (at john ?from))
      (at john ?to)
    )
  )

  (:action advance-to-s1
    :precondition (curtime s0)
    :effect (and (not (curtime s0)) (curtime s1))
  )

  (:action advance-to-s2
    :precondition (curtime s1)
    :effect (and (not (curtime s1)) (curtime s2))
  )

  (:action advance-to-s3
    :precondition (curtime s2)
    :effect (and (not (curtime s2)) (curtime s3))
  )

  (:action john-commit-available-s1
    :precondition (and (at john pacific-heights) (curtime s1) (person-available-start john s1))
    :effect (available-for-meeting)
  )

  (:action john-commit-available-s2
    :precondition (and (at john pacific-heights) (curtime s2) (person-available-start john s2))
    :effect (available-for-meeting)
  )

  (:action john-commit-available-s3
    :precondition (and (at john pacific-heights) (curtime s3) (person-available-start john s3))
    :effect (available-for-meeting)
  )

  (:action visitor-meet-john-s1
    :precondition (and
      (at visitor pacific-heights)
      (at john pacific-heights)
      (curtime s1)
      (available-for-meeting)
    )
    :effect (met visitor john)
  )

  (:action visitor-meet-john-s2
    :precondition (and
      (at visitor pacific-heights)
      (at john pacific-heights)
      (curtime s2)
      (available-for-meeting)
    )
    :effect (met visitor john)
  )

  (:action visitor-meet-john-s3
    :precondition (and
      (at visitor pacific-heights)
      (at john pacific-heights)
      (curtime s3)
      (available-for-meeting)
    )
    :effect (met visitor john)
  )
)