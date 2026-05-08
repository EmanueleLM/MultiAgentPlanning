(define (domain richmond-financial-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time)

  (:predicates
    ;; current stage/time token
    (now ?t - time)

    ;; mutually exclusive location predicates (planner must maintain consistency)
    (at-richmond)
    (at-financial)

    ;; explicit ordered stage successor relation (encodes contiguous time blocks)
    (succ ?t1 - time ?t2 - time)

    ;; successor predicates that specifically encode allowed travel intervals
    (succ-travel-richmond-financial ?t1 - time ?t2 - time)
    (succ-travel-financial-richmond ?t1 - time ?t2 - time)

    ;; successor predicates that encode contiguous meeting-duration blocks
    (succ-meet60 ?t1 - time ?t2 - time)
    (succ-meet15 ?t1 - time ?t2 - time)

    ;; terminal predicate indicating a contiguous 60-minute meeting has occurred
    (met-60)
  )

  ;; Travel from Richmond District to Financial District
  ;; This action can be applied only on a successor pair explicitly marked as the travel interval.
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
  ;; Requires an explicit successor pair marked for this travel interval.
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

  ;; Wait while at Richmond for a single successor stage transition.
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

  ;; Wait while at Financial for a single successor stage transition.
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

  ;; 60-minute atomic meeting action at Financial District.
  ;; Can be applied only on successor pairs explicitly marked as 60-minute meeting blocks.
  ;; This action establishes the required terminal condition (met-60) for the plan.
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

  ;; 15-minute meeting/block action at Financial District for fine-grained continuation.
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