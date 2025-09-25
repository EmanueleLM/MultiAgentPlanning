(define (domain meet-betty-compiled)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs :functions)
  (:types location timepoint)
  (:predicates
    (at-you ?l - location)
    (at-betty ?l - location)
    (now ?t - timepoint)
    (in-window ?t - timepoint)         ; timepoints that are valid meeting start times
    (can-travel-rd-fd ?t1 ?t2 - timepoint) ; precomputed travel transitions RD->FD
    (can-travel-fd-rd ?t1 ?t2 - timepoint) ; precomputed travel transitions FD->RD
    (can-wait ?t1 ?t2 - timepoint)     ; precomputed wait transitions (advance time)
    (can-meet-start ?t1 ?t2 - timepoint) ; allowed meeting start->end time pairs
    (met)
  )
  (:functions
    (total-cost)
  )

  ;; Your travel from Richmond to Financial (symbolic time transition)
  (:action you_travel_richmond_to_financial
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (at-you richmond)
      (now ?t1)
      (can-travel-rd-fd ?t1 ?t2)
    )
    :effect (and
      (not (at-you richmond))
      (at-you financial)
      (not (now ?t1))
      (now ?t2)
      (increase (total-cost) 22)
    )
  )

  ;; Your travel from Financial to Richmond (symbolic time transition)
  (:action you_travel_financial_to_richmond
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (at-you financial)
      (now ?t1)
      (can-travel-fd-rd ?t1 ?t2)
    )
    :effect (and
      (not (at-you financial))
      (at-you richmond)
      (not (now ?t1))
      (now ?t2)
      (increase (total-cost) 21)
    )
  )

  ;; Wait / advance time while staying at a location (symbolic)
  (:action you_wait
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (now ?t1)
      (can-wait ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      ;; Cost for waiting is encoded as the time difference precomputed in problem's can-wait pairs.
      ;; The exact numeric increase is provided here via different grounded instances in the problem (see problem file).
      ; placeholders; actual numeric increases will be provided by grounded actions using these parameters
    )
  )

  ;; Meeting action: start at a precomputed start time, ends at a precomputed end time (duration encoded by transition)
  (:action you_meet_betty_at_financial
    :parameters (?t1 ?t2 - timepoint)
    :precondition (and
      (at-you financial)
      (at-betty financial)
      (now ?t1)
      (can-meet-start ?t1 ?t2)
      (in-window ?t1)
    )
    :effect (and
      (met)
      (not (now ?t1))
      (now ?t2)
      (increase (total-cost) 60)
    )
  )

  ;; Betty has no mobile actions in this compiled model (she is available at Financial in the problem init).
  ;; Optionally include a no-op stay action for Betty to keep agent actions distinct if needed.
  (:action betty_stay
    :parameters ()
    :precondition ()
    :effect ()
  )
)