(define (domain stacking-multi-agent)
  (:requirements :typing :strips)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is on top of block ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing on ?x
    (vowel ?x - block)            ; moved only by the vowel-agent
    (consonant ?x - block)        ; moved only by the consonant-agent
  )

  ;-----------------------
  ; VOWEL AGENT ACTIONS
  ; (these actions are available only to the vowel-moving agent;
  ;  action names are prefixed with "vowel-" to keep them distinct)
  ;-----------------------

  ; Move a top vowel block from one block to another block
  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Move a top vowel block from a block onto the table
  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ; Move a vowel block from the table onto a clear block
  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;-----------------------
  ; CONSONANT AGENT ACTIONS
  ; (these actions are available only to the consonant-moving agent;
  ;  action names are prefixed with "consonant-" to keep them distinct)
  ;-----------------------

  ;; Move a consonant block from one block to another block
  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a consonant block from a block to the table
  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ;; Move a consonant block from the table onto a (clear) block
  (:action consonant-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )
)