(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block place stack) ; block is a subtype of place via typing below
  ; Type hierarchy: blocks are places (we implement this by declaring both types and using block where needed; stacks are distinct)
  ; Note: Classic PDDL doesn't allow declaration "block - place" in every parser; FastDownward accepts simple type hierarchies.
  (:constants) ; no domain-level constants besides objects provided in the problem

  (:predicates
    (on ?b - block ?p - place)       ; block ?b is directly on place ?p (place = block or stack)
    (clear ?p - place)               ; nothing on top of place ?p (p can be a block or a stack)
    (vowel ?b - block)               ; block is vowel-controlled (A, E, I)
    (consonant ?b - block)           ; block is consonant-controlled
    (handempty_vowel)                ; vowel agent hand empty (kept true for atomic moves)
    (handempty_cons)                 ; consonant agent hand empty (kept true for atomic moves)
  )

  ; -------------------------
  ; VOWEL AGENT: may move only vowel blocks (A,E,I)
  ; Two actions to implement the vowel preference: place onto a table stack, or onto another vowel block.
  ; Vowel agent will NOT place vowels onto consonant blocks (hard constraint).
  ; -------------------------

  (:action vowel_move_to_stack
    :parameters (?b - block ?from - place ?to - stack)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (handempty_vowel)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel_move_to_vowel
    :parameters (?b - block ?from - place ?to - block)
    :precondition (and
      (vowel ?b)
      (vowel ?to)            ; hard constraint: can only place vowel on vowel blocks
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (handempty_vowel)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  ; -------------------------
  ; CONSONANT AGENT: may move only consonant blocks
  ; Single atomic action: can move onto any place (stack or block)
  ; -------------------------

  (:action cons_move
    :parameters (?b - block ?from - place ?to - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (handempty_cons)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

)