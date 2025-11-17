(define (domain richmond-financial-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time)

  (:predicates
    ;; current time stage marker
    (now ?t - time)

    ;; mutually exclusive location predicates (one holds at a time)
    (at-richmond)
    (at-financial)

    ;; ordered successor relation for explicit contiguous time progression
    (succ ?t1 - time ?t2 - time)

    ;; travel-specific successor relation encoding exact travel duration for richmond->financial
    (succ-travel-richmond-financial ?t1 - time ?t2 - time)

    ;; meeting-duration successor relations (explicit contiguous meeting blocks)
    (succ-meet60 ?t1 - time ?t2 - time)
    (succ-meet15 ?t1 - time ?t2 - time)

    ;; terminal predicate indicating at least one contiguous 60-minute meeting with Betty occurred
    (met-betty)
  )

  ;; Travel from Richmond District to Financial District (requires the exact travel successor pair)
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

  ;; Wait while at Richmond (advance to the next explicit stage)
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

  ;; Wait while at Financial (advance to the next explicit stage)
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
  ;; These actions are only available where the corresponding succ-meet60 predicate is defined in the problem's init,
  ;; ensuring meetings only occur inside Betty's availability window and are contiguous.
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
              (met-betty)
            )
  )

  ;; 15-minute meeting/block action at Financial District for fine-grained continuation of meetings.
  ;; These are only available where succ-meet15 is defined in the problem's init.
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