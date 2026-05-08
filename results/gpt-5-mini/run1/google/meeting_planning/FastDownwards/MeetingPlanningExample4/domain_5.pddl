(define (domain presidio_marina_meetings)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)
    ;; time-step relations: one step = 5 minutes
    (succ_step ?t1 ?t2 - time)     ; +5 minutes
    (succ_2 ?t1 ?t2 - time)        ; +10 minutes (2 steps)
    (succ_12 ?t1 ?t2 - time)       ; +60 minutes (12 steps)
    (avail_start ?t - time)        ; allowed meeting start times (Jessica)
    (avail_end ?t - time)          ; allowed meeting end times (Jessica)
    (can_travel ?a - agent)
    (met_jessica)
    (is_jessica ?a - agent)
    (is_traveler ?a - agent)
  )

  ;; advance global time by one 5-minute step (waiting)
  (:action advance_step
    :parameters (?t1 ?t2 - time)
    :precondition (and (current_time ?t1) (succ_step ?t1 ?t2))
    :effect (and
              (not (current_time ?t1))
              (current_time ?t2)
            )
  )

  ;; traveler travels, takes exactly 10 minutes (succ_2)
  (:action travel_10min
    :parameters (?tstart ?tend - time ?trav - agent ?from - location ?to - location)
    :precondition (and
                    (current_time ?tstart)
                    (succ_2 ?tstart ?tend)
                    (at ?trav ?from)
                    (can_travel ?trav)
                    (is_traveler ?trav)
                  )
    :effect (and
              (not (current_time ?tstart))
              (current_time ?tend)
              (not (at ?trav ?from))
              (at ?trav ?to)
            )
  )

  ;; 60-minute contiguous meeting with Jessica (12 steps of 5 minutes)
  (:action meet_jessica_60
    :parameters (?tstart ?tend - time ?trav - agent ?j - agent ?loc - location)
    :precondition (and
                    (current_time ?tstart)
                    (succ_12 ?tstart ?tend)
                    (avail_start ?tstart)
                    (avail_end ?tend)
                    (at ?trav ?loc)
                    (at ?j ?loc)
                    (is_jessica ?j)
                    (is_traveler ?trav)
                    (not (met_jessica))
                  )
    :effect (and
              (not (current_time ?tstart))
              (current_time ?tend)
              (met_jessica)
            )
  )
)