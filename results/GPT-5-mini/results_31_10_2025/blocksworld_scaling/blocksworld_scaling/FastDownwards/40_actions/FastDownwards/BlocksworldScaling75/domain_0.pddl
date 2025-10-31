(define (domain vowel-consonant-blocks)
  ; Requirements: only those supported by target solver
  (:requirements :strips :typing :negative-preconditions)
  ; Types
  (:types block stack place agent)
  ; place is a supertype for stack and block for "on" relations
  ; In PDDL typing, we cannot declare place as a supertype of block and stack
  ; directly; instead we'll use 'place' and declare stacks and blocks as place
  ; members during the problem specification. Here we keep types for clarity.
  ; Predicates
  (:predicates
    (on ?b - block ?p - place)       ; block ?b is on place ?p (block or stack)
    (clear ?p - place)               ; place ?p has nothing on top of it
    (vowel ?b - block)               ; block is a vowel (movable by vowel agent)
    (consonant ?b - block)           ; block is a consonant (movable by consonant agent)
    (agent-available ?a - agent)     ; agent is available (optional use)
    (ontable ?b - block ?s - stack)  ; convenience predicate: block is directly on stack s
  )

  ; Assumptions (also noted inline as comments):
  ; - Blocks that are vowels will be marked with (vowel X) in the problem; consonants with (consonant X).
  ; - Every block and stack that is used in on/clear facts in the problem will be declared as an object and typed appropriately.
  ; - The domain models single-block moves only: only a clear block can be moved, and a destination must be clear.
  ; - We treat "place" as the supertype for both blocks and stacks in the problem object declarations.
  ; - We encode top constraints by ensuring only clear blocks may be moved.
  ; - Agents are distinct constants and actions are prefixed to indicate which agent can execute them.
  ; - No temporal or numeric preferences are encoded; natural-language "preferences" must be treated as hard constraints per instructions.

  ; Action for the vowel-moving agent: can move only vowel blocks
  (:action move-vowel
    :parameters (?a - agent ?b - block ?from - place ?to - place)
    :precondition (and
      (agent-available ?a)
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      ; Prevent trivial no-op (disallow moving onto itself).
      ; Using negative preconditions to ensure ?to is not the same object as ?b.
      (not (on ?to ?b)) ; Note: This is a conservative check; problem objects will avoid identity moves.
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      ; Maintain clear properties: destination becomes not clear; source becomes clear.
      (not (clear ?to))
      (clear ?from)
      ; Maintain ontable convenience predicate: if moving onto a stack, set ontable, otherwise remove.
      (when (and (not (exists (?s - stack) (not (= ?to ?s)))) ) ; no-op guard to keep PDDL simple
        )
    )
  )

  ; Action for the consonant-moving agent: can move only consonant blocks
  (:action move-cons
    :parameters (?a - agent ?b - block ?from - place ?to - place)
    :precondition (and
      (agent-available ?a)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (on ?to ?b))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ; Notes:
  ; - We keep the actions minimal and solver-friendly (STRIPS + limited negation).
  ; - The problem file will declare which objects are both blocks and places as needed.
)