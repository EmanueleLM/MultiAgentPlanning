(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person location slot)

  (:predicates
    (at ?p - person ?loc - location ?s - slot)
    (succ ?s1 - slot ?s2 - slot)
    (william_available ?s - slot)
    (met_william)
  )

  ; The traveler can remain at the same location for the next time slot.
  (:action stay
    :parameters (?loc - location ?s1 - slot ?s2 - slot)
    :precondition (and
      (at traveler ?loc ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (at traveler ?loc ?s2)
    )
  )

  ; Travel from Nob Hill to The Castro: takes 17 minutes -> modeled as 2 consecutive 15-min slots.
  ; If traveler is at nob_hill at slot s1 and there are two successor steps to s3,
  ; the traveler will be at the_castro at s3.
  (:action move_nob_hill_to_castro
    :parameters (?s1 - slot ?s2 - slot ?s3 - slot)
    :precondition (and
      (at traveler nob_hill ?s1)
      (succ ?s1 ?s2)
      (succ ?s2 ?s3)
    )
    :effect (and
      (at traveler the_castro ?s3)
    )
  )

  ; Travel from The Castro to Nob Hill: takes 16 minutes -> modeled as 2 consecutive 15-min slots.
  (:action move_castro_to_nob_hill
    :parameters (?s1 - slot ?s2 - slot ?s3 - slot)
    :precondition (and
      (at traveler the_castro ?s1)
      (succ ?s1 ?s2)
      (succ ?s2 ?s3)
    )
    :effect (and
      (at traveler nob_hill ?s3)
    )
  )

  ; Register that William has been met for at least 75 minutes (5 contiguous 15-min slots).
  ; Preconditions require traveler and William being at The Castro for five consecutive slots.
  (:action register_meeting_with_william
    :parameters (?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot ?s5 - slot)
    :precondition (and
      (at traveler the_castro ?s1)
      (at traveler the_castro ?s2)
      (at traveler the_castro ?s3)
      (at traveler the_castro ?s4)
      (at traveler the_castro ?s5)
      (william_available ?s1)
      (william_available ?s2)
      (william_available ?s3)
      (william_available ?s4)
      (william_available ?s5)
      (succ ?s1 ?s2)
      (succ ?s2 ?s3)
      (succ ?s3 ?s4)
      (succ ?s4 ?s5)
    )
    :effect (and
      (met_william)
    )
  )
)