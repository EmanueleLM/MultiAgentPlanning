(define (domain presidio_marina_meetings)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)
    (succ_1 ?t1 ?t2 - time)
    (succ_10 ?t1 ?t2 - time)
    (succ_60 ?t1 ?t2 - time)
    (aligned_15 ?t - time)
    (avail_start ?t - time)
    (avail_end ?t - time)
    (met_jessica)
  )

  ;; advance forward by 1 minute (uses succ_1)
  (:action advance_1min
    :parameters (?t1 ?t2 - time)
    :precondition (and (current_time ?t1) (succ_1 ?t1 ?t2))
    :effect (and
              (not (current_time ?t1))
              (current_time ?t2)
            )
  )

  ;; Travel taking exactly 10 minutes (succ_10). Generic between any two locations.
  (:action travel_10min
    :parameters (?tstart ?tend - time ?trav - agent ?from - location ?to - location)
    :precondition (and
                    (current_time ?tstart)
                    (at ?trav ?from)
                    (succ_10 ?tstart ?tend)
                  )
    :effect (and
              (not (current_time ?tstart))
              (current_time ?tend)
              (not (at ?trav ?from))
              (at ?trav ?to)
            )
  )

  ;; Meeting actions (contiguous meeting). At least one meeting with Jessica of 60 minutes.
  ;; Start must be aligned to 15-minute increments and within Jessica availability window.
  (:action meet_jessica_60
    :parameters (?tstart ?tend - time ?trav - agent ?loc - location)
    :precondition (and
                    (current_time ?tstart)
                    (succ_60 ?tstart ?tend)
                    (aligned_15 ?tstart)
                    (avail_start ?tstart)
                    (avail_end ?tend)
                    (at ?trav ?loc)
                    (not (met_jessica))
                  )
    :effect (and
              (not (current_time ?tstart))
              (current_time ?tend)
              (met_jessica)
            )
  )

  ;; Optional longer meeting variants (kept to allow alternatives if available)
  (:action meet_jessica_90
    :parameters (?tstart ?tend - time ?trav - agent ?loc - location)
    :precondition (and
                    (current_time ?tstart)
                    (succ_60 ?tstart ?t_tmp) ;; reuse succ_60 and succ_1/10 chains in problem if needed
                    (succ_60 ?t_tmp ?tend)
                    (aligned_15 ?tstart)
                    (avail_start ?tstart)
                    (avail_end ?tend)
                    (at ?trav ?loc)
                    (not (met_jessica))
                  )
    :effect (and
              (not (current_time ?tstart))
              (current_time ?tend)
              (met_jessica)
            )
  )

  (:action meet_jessica_120
    :parameters (?tstart ?tend - time ?trav - agent ?loc - location)
    :precondition (and
                    (current_time ?tstart)
                    (succ_60 ?tstart ?t_mid1)
                    (succ_60 ?t_mid1 ?tend)
                    (aligned_15 ?tstart)
                    (avail_start ?tstart)
                    (avail_end ?tend)
                    (at ?trav ?loc)
                    (not (met_jessica))
                  )
    :effect (and
              (not (current_time ?tstart))
              (current_time ?tend)
              (met_jessica)
            )
  )

)