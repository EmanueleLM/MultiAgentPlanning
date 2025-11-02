(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity block place)
  (:predicates
    (on ?b - block ?x - entity)        ; block b is directly on entity x (block or place)
    (clear ?b - block)                 ; no block on top of b
    (vowel ?b - block)
    (consonant ?b - block)
    (fixed ?b - block)                 ; consonant b has been marked fixed in its final position
    (goal_below ?b - block ?x - entity) ; final required direct-support for b (block or place)
  )

  ; -------------------------
  ; Vowel-agent actions (can move only vowel-labeled blocks)
  ; -------------------------

  ;; Move vowel from a block to another block (destination must be a fixed consonant)
  (:action vowel_agent-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (consonant ?to)
      (fixed ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move vowel from a place (table spot) to a block (destination must be a fixed consonant)
  (:action vowel_agent-move-place-to-block
    :parameters (?b - block ?from - place ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (consonant ?to)
      (fixed ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Move vowel from a block to a place (buffering move onto table allowed only as temporary buffer)
  (:action vowel_agent-move-block-to-place
    :parameters (?b - block ?from - block ?place - place)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?place)
      (clear ?from)
    )
  )

  ;; Move vowel from a place to a place (rare, allow moving between table spots)
  (:action vowel_agent-move-place-to-place
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
    )
  )

  ; -------------------------
  ; Consonant-agent actions (can move only consonant-labeled blocks)
  ; -------------------------

  ;; Move consonant from a block to another block
  (:action consonant_agent-move-block-to-block
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
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move consonant from a place to a block
  (:action consonant_agent-move-place-to-block
    :parameters (?b - block ?from - place ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Move consonant from a block to a place (place = create/use table stack)
  (:action consonant_agent-move-block-to-place
    :parameters (?b - block ?from - block ?place - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?place)
      (clear ?from)
    )
  )

  ;; Move consonant from a place to a place (allow repositioning between table spots)
  (:action consonant_agent-move-place-to-place
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
    )
  )

  ; -------------------------
  ; Consonant-agent "fix" actions: mark a consonant as fixed when it is in its final position
  ; (two variants: fixed when directly on its goal place, or when on its goal block whose fixed status is already set)
  ; -------------------------

  ;; Fix consonant when it is on the goal place (place is a 'place' such as table1)
  (:action consonant_agent-fix-on-place
    :parameters (?b - block ?place - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?place)
      (goal_below ?b ?place)
      (clear ?b)
    )
    :effect (and
      (fixed ?b)
    )
  )

  ;; Fix consonant when it is on the goal block and that supporting block is already fixed
  (:action consonant_agent-fix-on-block
    :parameters (?b - block ?below - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?below)
      (goal_below ?b ?below)
      (clear ?b)
      (fixed ?below)
    )
    :effect (and
      (fixed ?b)
    )
  )

)