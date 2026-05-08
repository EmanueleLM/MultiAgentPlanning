(define (domain richmond-financial-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time)

  (:predicates
    (now ?t - time)
    (at-richmond)
    (at-financial)

    ;; discrete-time relations (minute-step relations are encoded as static predicates)
    (after22 ?t1 ?t2 - time)
    (after60 ?t1 ?t2 - time)
    (after15 ?t1 ?t2 - time)

    ;; meeting availability predicates (which start times are allowed for starting a meeting block)
    (allow-meet60 ?t - time)
    (allow-meet15 ?t - time)

    ;; coarse meeting-accumulation levels (goal requires reaching met-60)
    (met-0)
    (met-60)
  )

  ;; Travel Richmond -> Financial (22 minutes)
  (:action travel-richmond-to-financial
    :parameters (?t1 ?t2 - time)
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
  ;; Note: the problem below does not require using this action, but it is provided for completeness.
  (:action travel-financial-to-richmond
    :parameters (?t1 ?t2 - time)
    :precondition (and
                    (at-financial)
                    (not (at-richmond))
                    (now ?t1)
                    ;; We do not assert a specific after21 predicate here in the domain;
                    ;; the problem can provide suitable after21 facts if needed. To keep the domain minimal,
                    ;; this action uses the after22 predicate name but a problem could also populate after22 appropriately.
                    (after22 ?t1 ?t2)
                  )
    :effect (and
              (not (at-financial))
              (at-richmond)
              (not (now ?t1))
              (now ?t2)
            )
  )

  ;; Wait action that advances time by a provided relation (15-minute wait used in the provided problem).
  (:action wait-by-15
    :parameters (?t1 ?t2 - time)
    :precondition (and
                    (now ?t1)
                    (after15 ?t1 ?t2)
                  )
    :effect (and
              (not (now ?t1))
              (now ?t2)
            )
  )

  ;; Atomic 60-minute meeting action: advances time by 60 and marks met-60.
  ;; This action is usable only at Financial District and only when starting at an allowed start time.
  ;; It consumes a contiguous 60-minute block (encoded by after60 facts).
  (:action meet-betty-60
    :parameters (?t1 ?t2 - time)
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
)