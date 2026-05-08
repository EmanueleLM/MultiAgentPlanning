(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types agent location person time)

  (:predicates
    (at_time ?ag - agent ?loc - location ?t - time)            ; agent is at location at a specific timepoint
    (met ?p - person)                                          ; friend has been met
    (travel_time ?from - location ?to - location ?tfrom - time ?tto - time) ; allowed travel leg with explicit from/to times
    (wait_time ?loc - location ?tfrom - time ?tto - time)     ; allowed wait (stay) at a location advancing time
    (meeting_window ?loc - location ?tstart - time ?tend - time) ; friend present window at location
    (meeting_possible ?tstart - time ?tend - time)            ; a meeting of required length can start at tstart and finish at tend
  )

  ;; Travel moves an agent from one location at a specific start time to another location at the corresponding arrival time.
  (:action travel
    :parameters (?ag - agent ?from - location ?to - location ?tfrom - time ?tto - time)
    :precondition (and
      (at_time ?ag ?from ?tfrom)
      (travel_time ?from ?to ?tfrom ?tto)
    )
    :effect (and
      (not (at_time ?ag ?from ?tfrom))
      (at_time ?ag ?to ?tto)
    )
  )

  ;; Wait advances an agent at the same location between two explicit timepoints.
  (:action wait
    :parameters (?ag - agent ?loc - location ?tfrom - time ?tto - time)
    :precondition (and
      (at_time ?ag ?loc ?tfrom)
      (wait_time ?loc ?tfrom ?tto)
    )
    :effect (and
      (not (at_time ?ag ?loc ?tfrom))
      (at_time ?ag ?loc ?tto)
    )
  )

  ;; Meet Betty: requires being at the meeting location at a start time when Betty is present
  ;; and that a meeting of the minimum required duration is possible (encoded by meeting_possible).
  ;; The effect records that Betty was met and advances the agent to the meeting end time.
  (:action meet_betty
    :parameters (?ag - agent ?p - person ?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (at_time ?ag ?loc ?tstart)
      (meeting_window ?loc ?tstart ?tend)
      (meeting_possible ?tstart ?tend)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
      (not (at_time ?ag ?loc ?tstart))
      (at_time ?ag ?loc ?tend)
    )
  )
)