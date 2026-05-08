(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (next ?t1 - time ?t2 - time)
    (at ?ag - agent ?loc - location ?t - time)
    (free ?ag - agent ?t - time)
    (kenneth_available ?t - time)
    (met90)
  )

  ;; wait one time-slot while staying at the same location
  (:action wait
    :parameters (?ag - agent ?loc - location ?t - time ?t1 - time)
    :precondition (and
      (next ?t ?t1)
      (at ?ag ?loc ?t)
      (free ?ag ?t)
    )
    :effect (and
      (not (at ?ag ?loc ?t))
      (at ?ag ?loc ?t1)
      (not (free ?ag ?t))
    )
  )

  ;; travel from fishermans_wharf to nob_hill in one time-slot (rounded)
  (:action travel_fw_to_nobhill
    :parameters (?ag - agent ?t - time ?t1 - time)
    :precondition (and
      (next ?t ?t1)
      (at ?ag fishermans_wharf ?t)
      (free ?ag ?t)
    )
    :effect (and
      (not (at ?ag fishermans_wharf ?t))
      (at ?ag nob_hill ?t1)
      (not (free ?ag ?t))
    )
  )

  ;; travel from nob_hill back to fishermans_wharf in one time-slot
  (:action travel_nobhill_to_fw
    :parameters (?ag - agent ?t - time ?t1 - time)
    :precondition (and
      (next ?t ?t1)
      (at ?ag nob_hill ?t)
      (free ?ag ?t)
    )
    :effect (and
      (not (at ?ag nob_hill ?t))
      (at ?ag fishermans_wharf ?t1)
      (not (free ?ag ?t))
    )
  )

  ;; meet Kenneth for 90 minutes = 6 consecutive 15-minute slots.
  ;; Preconditions require being at nob_hill at the meeting start and free
  ;; and Kenneth available for six consecutive slots.
  (:action meet_kenneth_90
    :parameters (?ag - agent
                 ?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time)
    :precondition (and
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4) (next ?t4 ?t5) (next ?t5 ?t6)
      (at ?ag nob_hill ?t0)

      (free ?ag ?t0) (free ?ag ?t1) (free ?ag ?t2) (free ?ag ?t3) (free ?ag ?t4) (free ?ag ?t5)

      (kenneth_available ?t0) (kenneth_available ?t1) (kenneth_available ?t2)
      (kenneth_available ?t3) (kenneth_available ?t4) (kenneth_available ?t5)
    )
    :effect (and
      ;; occupy the six slots of the meeting
      (not (free ?ag ?t0)) (not (free ?ag ?t1)) (not (free ?ag ?t2))
      (not (free ?ag ?t3)) (not (free ?ag ?t4)) (not (free ?ag ?t5))

      ;; advance the agent's location marker to the end of the meeting
      (not (at ?ag nob_hill ?t0))
      (at ?ag nob_hill ?t6)

      ;; record that the 90-minute meeting happened
      (met90)
    )
  )
)