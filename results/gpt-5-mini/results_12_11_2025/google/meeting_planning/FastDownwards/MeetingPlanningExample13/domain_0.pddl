(define (domain itinerary)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location friend option)
  (:predicates
    (at ?l - location)
    (met ?f - friend)
    (option-chosen ?o - option)
    (done)
  )

  ;; Option 1: schedule that meets all 7 friends (uses provided feasible sequence and travel)
  (:action choose-option1
    :parameters ()
    :precondition (and
      (at presidio)
      (not (option-chosen option2))
      (not (option-chosen option3))
      (not (done))
    )
    :effect (and
      ;; mark chosen option
      (option-chosen option1)
      ;; mark all friends met according to Option 1
      (met alice)
      (met carlos)
      (met farah)
      (met eli)
      (met dana)
      (met betty)
      (met grace)
      ;; final location after Option 1 is NorthBeach (arrive 21:00 in candidate)
      (not (at presidio))
      (at northbeach)
      ;; indicate completion
      (done)
      ;; cost: negative of number of distinct friends met, to prefer more friends
      (increase (total-cost) -7)
    )
  )

  ;; Option 2: schedule that meets 6 friends (provided feasible sequence)
  (:action choose-option2
    :parameters ()
    :precondition (and
      (at presidio)
      (not (option-chosen option1))
      (not (option-chosen option3))
      (not (done))
    )
    :effect (and
      (option-chosen option2)
      (met alice)
      (met carlos)
      (met eli)
      (met dana)
      (met betty)
      (met grace)
      ;; final location after Option 2 is NorthBeach (arrive 21:15 in candidate)
      (not (at presidio))
      (at northbeach)
      (done)
      (increase (total-cost) -6)
    )
  )

  ;; Option 3: schedule that meets 4 friends (provided feasible sequence)
  (:action choose-option3
    :parameters ()
    :precondition (and
      (at presidio)
      (not (option-chosen option1))
      (not (option-chosen option2))
      (not (done))
    )
    :effect (and
      (option-chosen option3)
      (met alice)
      (met carlos)
      (met farah)
      (met betty)
      ;; final location after Option 3 is NorthBeach (arrive 20:45 in candidate)
      (not (at presidio))
      (at northbeach)
      (done)
      (increase (total-cost) -4)
    )
  )
)