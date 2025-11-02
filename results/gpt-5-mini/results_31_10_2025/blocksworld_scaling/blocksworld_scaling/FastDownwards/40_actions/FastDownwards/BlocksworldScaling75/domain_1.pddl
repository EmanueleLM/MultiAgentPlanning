(define (domain vowel-consonant-blocks)
  ;; Requirements compatible with Fast Downward
  (:requirements :strips :typing :negative-preconditions)

  ;; Simple typing: everything manipulable is an object; agents are a separate type.
  (:types object agent)

  ;; Predicates:
  ;; (on ?b ?p)     : block/object ?b is directly on place/object ?p (p may be a block or the table)
  ;; (clear ?o)     : object ?o has nothing directly on top of it (used for blocks only)
  ;; (block ?o)     : object ?o is a block
  ;; (table ?o)     : object ?o is the table (there may be only one in the problem)
  ;; (vowel ?o)     : block ?o is a vowel (movable only by vowel_agent)
  ;; (consonant ?o): block ?o is a consonant (movable only by consonant_agent)
  ;; (vowel-agent ?a) / (consonant-agent ?a): mark which agent is which
  (:predicates
    (on ?b - object ?p - object)
    (clear ?o - object)
    (block ?o - object)
    (table ?o - object)
    (vowel ?o - object)
    (consonant ?o - object)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  ;; Assumptions (also encoded as comments for human readers):
  ;; - There is a single table object (declared in the problem). The table may have multiple blocks directly on it,
  ;;   therefore table objects are not required to be 'clear' and the domain provides different actions for moving
  ;;   onto a block vs onto the table.
  ;; - Only blocks that satisfy (clear ?b) may be picked up (i.e., only top blocks of stacks).
  ;; - Vowel moves are named "move-vowel-..." and require (vowel-agent ?a) and (vowel ?b).
  ;; - Consonant moves are named "move-cons-..." and require (consonant-agent ?a) and (consonant ?b).
  ;; - Actions are split by source-type (block or table) and target-type (block or table) so that effects on 'clear'
  ;;   are handled correctly (moving from a block makes that source block clear; moving from the table does not).
  ;; - No action allows moving a block onto itself (negative precondition prevents ?to = ?b).

  ;; ---------- Vowel agent actions ----------

  ;; Move a vowel block from a block onto another block
  (:action move-vowel-block->block
    :parameters (?ag - agent ?b - object ?from - object ?to - object)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?b)
      (block ?b)
      (on ?b ?from)
      (block ?from)             ;; source is a block (so source becomes clear after move)
      (block ?to)               ;; destination is a block (so destination must be clear)
      (clear ?b)
      (clear ?to)
      (not (= ?to ?b))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)             ;; source block becomes clear
      (not (clear ?to))         ;; destination is no longer clear
    )
  )

  ;; Move a vowel block from the table onto a block
  (:action move-vowel-table->block
    :parameters (?ag - agent ?b - object ?from - object ?to - object)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?b)
      (block ?b)
      (on ?b ?from)
      (table ?from)             ;; source is the table (table remains unchanged)
      (block ?to)
      (clear ?b)
      (clear ?to)
      (not (= ?to ?b))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Move a vowel block from a block onto the table
  (:action move-vowel-block->table
    :parameters (?ag - agent ?b - object ?from - object ?to - object)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?b)
      (block ?b)
      (on ?b ?from)
      (block ?from)
      (table ?to)               ;; destination is table (table may have many blocks)
      (clear ?b)
      (not (= ?to ?b))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)             ;; source block becomes clear
    )
  )

  ;; Move a vowel block from the table onto the table (useful if multiple tables are present; harmless here)
  (:action move-vowel-table->table
    :parameters (?ag - agent ?b - object ?from - object ?to - object)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?b)
      (block ?b)
      (on ?b ?from)
      (table ?from)
      (table ?to)
      (clear ?b)
      (not (= ?to ?b))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
    )
  )

  ;; ---------- Consonant agent actions ----------

  ;; Move a consonant block from a block onto another block
  (:action move-cons-block->block
    :parameters (?ag - agent ?b - object ?from - object ?to - object)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (block ?b)
      (on ?b ?from)
      (block ?from)
      (block ?to)
      (clear ?b)
      (clear ?to)
      (not (= ?to ?b))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a consonant block from the table onto a block
  (:action move-cons-table->block
    :parameters (?ag - agent ?b - object ?from - object ?to - object)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (block ?b)
      (on ?b ?from)
      (table ?from)
      (block ?to)
      (clear ?b)
      (clear ?to)
      (not (= ?to ?b))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Move a consonant block from a block onto the table
  (:action move-cons-block->table
    :parameters (?ag - agent ?b - object ?from - object ?to - object)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (block ?b)
      (on ?b ?from)
      (block ?from)
      (table ?to)
      (clear ?b)
      (not (= ?to ?b))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
    )
  )

  ;; Move a consonant block from the table onto the table
  (:action move-cons-table->table
    :parameters (?ag - agent ?b - object ?from - object ?to - object)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (block ?b)
      (on ?b ?from)
      (table ?from)
      (table ?to)
      (clear ?b)
      (not (= ?to ?b))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
    )
  )

)