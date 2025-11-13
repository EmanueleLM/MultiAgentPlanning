(define (domain richmond-financial-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time)

  (:predicates
    ;; current time token (exact stage)
    (now ?t - time)

    ;; mutually exclusive location predicates
    (at-richmond)
    (at-financial)

    ;; discrete ordered stage successor relation:
    ;; succ t_i t_j means t_j is the immediate next stage following t_i
    (succ ?t1 - time ?t2 - time)

    ;; allowed meeting-start tokens encode Betty's availability window for specific stage starts
    (allow-meet60 ?t - time)
    (allow-meet15 ?t - time)

    ;; terminal predicate indicating at least 60 meeting minutes achieved via a contiguous 60-min block
    (met-60)
  )

  ;; Travel Richmond -> Financial (uses an explicit succ stage that encodes the required 22-minute interval)
  (:action travel-richmond-to-financial
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-richmond)
                    (not (at-financial))
                    (now ?t1)
                    (succ ?t1 ?t2)
                  )
    :effect (and
              (not (at-richmond))
              (at-financial)
              (not (now ?t1))
              (now ?t2)
            )
  )

  ;; Travel Financial -> Richmond (uses a succ stage that encodes the required 21-minute interval)
  (:action travel-financial-to-richmond
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-financial)
                    (not (at-richmond))
                    (now ?t1)
                    (succ ?t1 ?t2)
                  )
    :effect (and
              (not (at-financial))
              (at-richmond)
              (not (now ?t1))
              (now ?t2)
            )
  )

  ;; Wait action: advance time across an explicitly declared successor stage;
  ;; preserves current location predicate.
  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (now ?t1)
                    (succ ?t1 ?t2)
                  )
    :effect (and
              (not (now ?t1))
              (now ?t2)
            )
  )

  ;; 60-minute atomic meeting action at Financial District.
  ;; Requires being at the Financial location and the designated succ stage that
  ;; corresponds to a contiguous 60-minute block start; sets met-60 as a terminal token.
  (:action meet-betty-60
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-financial)
                    (now ?t1)
                    (succ ?t1 ?t2)
                    (allow-meet60 ?t1)
                  )
    :effect (and
              (at-financial)
              (not (now ?t1))
              (now ?t2)
              (met-60)
            )
  )

  ;; 15-minute meeting/block action (fine-grained contiguous increments).
  (:action meet-betty-15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-financial)
                    (now ?t1)
                    (succ ?t1 ?t2)
                    (allow-meet15 ?t1)
                  )
    :effect (and
              (at-financial)
              (not (now ?t1))
              (now ?t2)
            )
  )
)