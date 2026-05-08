(define (domain BlocksworldScaling8)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    (handempty)
    (holding ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (at ?s - step)                    ; current global stage
    (next ?s - step ?s2 - step)       ; stage successor relation
  )

  ;; Picker actions: pick up a block from the table, put a held block down on the table.
  ;; Each action consumes the current stage and produces the next stage, enforcing discrete,
  ;; contiguous progression of time and forbidding oscillation between non-successor stages.
  (:action picker_pick_up
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and
      (handempty)
      (ontable ?b)
      (clear ?b)
      (at ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (handempty))
      (not (clear ?b))
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action picker_put_down
    :parameters (?b - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?b)
      (at ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (at ?s))
      (at ?s2)
    )
  )

  ;; Stacker actions: unstack a clear block from on top of another block into the hand,
  ;; and stack a held block onto a clear block.
  (:action stacker_unstack
    :parameters (?b - block ?c - block ?s - step ?s2 - step)
    :precondition (and
      (handempty)
      (on ?b ?c)
      (clear ?b)
      (at ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (clear ?c)            ; underlying block becomes clear after removing top
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (not (at ?s))
      (at ?s2)
    )
  )

  (:action stacker_stack
    :parameters (?b - block ?c - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (at ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?c)
      (not (clear ?c))     ; target block is no longer clear
      (clear ?b)           ; placed block is clear on top
      (handempty)
      (not (holding ?b))
      (not (at ?s))
      (at ?s2)
    )
  )
)