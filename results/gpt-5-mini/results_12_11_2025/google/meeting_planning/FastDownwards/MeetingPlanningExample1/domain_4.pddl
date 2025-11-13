(define (domain richmond-financial-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time)

  (:predicates
    ;; current time token
    (now ?t - time)

    ;; mutually exclusive location predicates (solver must maintain exclusivity via actions)
    (at-richmond)
    (at-financial)

    ;; explicit discrete contiguous-duration relations (structural durations)
    (after22 ?t1 - time ?t2 - time)   ;; richmond -> financial = 22 minutes
    (after21 ?t1 - time ?t2 - time)   ;; financial -> richmond = 21 minutes (provided for completeness)
    (after60 ?t1 - time ?t2 - time)   ;; 60-minute contiguous block
    (after15 ?t1 - time ?t2 - time)   ;; 15-minute contiguous block
    (after-wait ?t1 - time ?t2 - time) ;; explicit wait blocks

    ;; allowed meeting-start tokens (encode Betty's availability window as allowed start times)
    (allow-meet60 ?t - time)
    (allow-meet15 ?t - time)

    ;; terminal predicate indicating at least 60 meeting minutes achieved
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

  ;; Wait action: advance time across an explicitly declared contiguous wait block;
  ;; does not change location predicates (preserves current at-*).
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

  ;; 60-minute atomic meeting action at Financial District.
  ;; Requires an explicit 60-minute contiguous block starting at an allowed start time.
  ;; Preserves being at Financial (meeting occurs in-place) and sets met-60 (terminal requirement).
  (:action meet-betty-60
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-financial)
                    (now ?t1)
                    (after60 ?t1 ?t2)
                    (allow-meet60 ?t1)
                  )
    :effect (and
              ;; remain at financial after meeting
              (at-financial)
              (not (now ?t1))
              (now ?t2)
              ;; record that at least 60 minutes have been met
              (met-60)
            )
  )

  ;; 15-minute meeting/block action (optional fine-grained contiguous increments).
  ;; Does not directly affect met-60; used to compose schedules within availability tail segments.
  (:action meet-betty-15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
                    (at-financial)
                    (now ?t1)
                    (after15 ?t1 ?t2)
                    (allow-meet15 ?t1)
                  )
    :effect (and
              (at-financial)
              (not (now ?t1))
              (now ?t2)
            )
  )
)