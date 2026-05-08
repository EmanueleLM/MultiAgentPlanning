(define (domain richmond-financial-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time)

  (:predicates
    ;; current time stage
    (now ?t - time)

    ;; mutually exclusive location predicates
    (at-richmond)
    (at-financial)

    ;; ordered successor relation for contiguous time progression
    (succ ?t1 - time ?t2 - time)

    ;; travel-specific successor relations that encode exact travel durations
    (succ-travel-richmond-financial ?t1 - time ?t2 - time)
    (succ-travel-financial-richmond ?t1 - time ?t2 - time)

    ;; meeting-duration successor relations (explicit contiguous meeting blocks)
    (succ-meet60 ?t1 - time ?t2 - time)
    (succ-meet15 ?t1 - time ?t2 - time)

    ;; terminal predicate indicating a contiguous 60-minute meeting has occurred
    (met-60)
  )

  ;; Travel from Richmond District to Financial District
  (:action travel-richmond-to-financial
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-richmond)
                    (now ?t1)
                    (succ-travel-richmond-financial ?t1 ?t2)
                  )
    :effect (and
              (not (at-richmond))
              (at-financial)
              (not (now ?t1))
              (now ?t2)
            )
  )

  ;; Travel from Financial District to Richmond District
  (:action travel-financial-to-richmond
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-financial)
                    (now ?t1)
                    (succ-travel-financial-richmond ?t1 ?t2)
                  )
    :effect (and
              (not (at-financial))
              (at-richmond)
              (not (now ?t1))
              (now ?t2)
            )
  )

  ;; Wait transition while at Richmond (advances to the next explicit stage)
  (:action wait-while-at-richmond
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-richmond)
                    (now ?t1)
                    (succ ?t1 ?t2)
                  )
    :effect (and
              (at-richmond)
              (not (now ?t1))
              (now ?t2)
            )
  )

  ;; Wait transition while at Financial (advances to the next explicit stage)
  (:action wait-while-at-financial
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-financial)
                    (now ?t1)
                    (succ ?t1 ?t2)
                  )
    :effect (and
              (at-financial)
              (not (now ?t1))
              (now ?t2)
            )
  )

  ;; 60-minute atomic meeting action at Financial District that establishes the required terminal condition.
  (:action meet-betty-60
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-financial)
                    (now ?t1)
                    (succ-meet60 ?t1 ?t2)
                  )
    :effect (and
              (at-financial)
              (not (now ?t1))
              (now ?t2)
              (met-60)
            )
  )

  ;; 15-minute meeting/block action at Financial District for fine-grained continuation of meetings.
  (:action meet-betty-15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-financial)
                    (now ?t1)
                    (succ-meet15 ?t1 ?t2)
                  )
    :effect (and
              (at-financial)
              (not (now ?t1))
              (now ?t2)
            )
  )
)