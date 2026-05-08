(define (domain richmond-financial-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time)

  (:predicates
    (now ?t - time)
    (at-richmond)
    (at-financial)

    ;; discrete advance relations encoding contiguous occupancy for specific durations
    (after22 ?t1 - time ?t2 - time)
    (after21 ?t1 - time ?t2 - time)
    (after60 ?t1 - time ?t2 - time)
    (after15 ?t1 - time ?t2 - time)
    (after-wait ?t1 - time ?t2 - time)

    ;; allowed meeting start times within Betty's availability window
    (allow-meet60 ?t - time)
    (allow-meet15 ?t - time)

    ;; meeting accumulation flags
    (met-0)
    (met-60)
  )

  ;; Travel Richmond -> Financial (22 minutes)
  (:action travel-richmond-to-financial
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-richmond)
                    (not (at-financial))
                    (now ?t1)
                    (after22 ?t1 ?t2)
                  )
    :effect (and
              (not (at-richmond))
              (at-financial)
              (not (now ?t1))
              (now ?t2)
            )
  )

  ;; Travel Financial -> Richmond (21 minutes)
  (:action travel-financial-to-richmond
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-financial)
                    (not (at-richmond))
                    (now ?t1)
                    (after21 ?t1 ?t2)
                  )
    :effect (and
              (not (at-financial))
              (at-richmond)
              (not (now ?t1))
              (now ?t2)
            )
  )

  ;; Wait action: explicit contiguous wait from ?t1 to ?t2 (uses a provided after-wait fact).
  ;; This action preserves current location (does not add/remove any at-* facts).
  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (now ?t1)
                    (after-wait ?t1 ?t2)
                  )
    :effect (and
              (not (now ?t1))
              (now ?t2)
            )
  )

  ;; 60-minute atomic meeting action at Financial District (consumes contiguous 60-minute block).
  (:action meet-betty-60
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-financial)
                    (now ?t1)
                    (after60 ?t1 ?t2)
                    (allow-meet60 ?t1)
                    (met-0)
                  )
    :effect (and
              (not (now ?t1))
              (now ?t2)
              (not (met-0))
              (met-60)
            )
  )

  ;; 15-minute atomic meeting action at Financial District (optional fine-grained block).
  (:action meet-betty-15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-financial)
                    (now ?t1)
                    (after15 ?t1 ?t2)
                    (allow-meet15 ?t1)
                  )
    :effect (and
              (not (now ?t1))
              (now ?t2)
            )
  )
)