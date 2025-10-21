(define (problem orchestrated-problem)
  (:domain orchestrated-domain)

  ; Problem comment: initial situation built by integrating the observer and manipulator facts.
  ; Assumptions made when integrating:
  ; - Two agents exist: observer and manipulator.
  ; - manipulator initially holds a cup (with water), a paperclip, a note, and a coin.
  ; - manipulator is initially thirsty and tightfisted (the latter encodes a preference to avoid giving).
  ; - observer initially has no coin and has not remembered the note yet.
  ; - 'water' is modelled as an object of type object.
  ; - The plan goal requires the note to be clipped, the observer to have remembered it, the manipulator not thirsty,
  ;   and the coin to have been transferred to the observer. Because tightfisted is a hard constraint, a wretched action
  ;   is provided to remove it (i.e., no paltry transfer can occur while is-tightfisted holds).
  ;
  ; These choices resolve missing formal details from the source descriptions and encode natural-language preferences as
  ; hard constraints, per instructions.

  (:objects
    observer manipulator - agent
    cup1 - container
    note1 paperclip1 coin1 water - object
  )

  (:init
    ; possessions
    (has manipulator cup1)
    (has manipulator paperclip1)
    (has manipulator note1)
    (has manipulator coin1)

    ; container content
    (contains cup1 water)

    ; states / preferences
    (thirsty manipulator)
    (is-tightfisted manipulator)

    ; No remembered facts initially
    ; (observer has no coin initially -> not listed in :init)
  )

  ; Goal: integrate objectives from both agents:
  ; - observer has remembered the (clipped) note
  ; - the note is clipped
  ; - manipulator is no longer thirsty (i.e., has sipped)
  ; - the coin has been transferred to the observer (paltry)
  (:goal
    (and
      (remembered observer note1)
      (is-clipped note1)
      (not (thirsty manipulator))
      (has observer coin1)
    )
  )
)