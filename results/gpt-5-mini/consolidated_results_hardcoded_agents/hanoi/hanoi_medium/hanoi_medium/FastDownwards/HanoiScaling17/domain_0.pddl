(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place agent phase)
  ;; peg and disk are subtypes of place to allow (on ?d ?x) where ?x is a place
  (:constants)  

  (:predicates
    (on ?d - disk ?x - place)            ; disk ?d is directly on place ?x (peg or disk)
    (clear ?x - place)                  ; nothing is directly on place ?x
    (empty ?p - peg)                    ; peg ?p has no disk directly on it
    (smaller ?a - disk ?b - disk)       ; disk ?a is smaller than disk ?b (static)
    (agent ?ag - agent)                 ; agent identity facts (static)
    (current-phase ?ph - phase)         ; which phase is active now (exactly one true)
    (next ?p1 - phase ?p2 - phase)      ; allowed phase transitions (static)
  )

  ;; ---------- Actions for agent a1 ----------
  ;; Move a disk from a peg to another empty peg
  (:action move-peg-to-peg-by-a1
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?p - phase ?pnext - phase)
    :precondition (and
      (agent ?ag)
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
      (current-phase ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (empty ?from)
      (not (empty ?to))
      (clear ?d)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )

  ;; Move a disk from a peg to a (clear) disk (respecting sizes)
  (:action move-peg-to-disk-by-a1
    :parameters (?ag - agent ?d - disk ?from - peg ?to - disk ?p - phase ?pnext - phase)
    :precondition (and
      (agent ?ag)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current-phase ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (empty ?from)
      (not (clear ?to))
      (clear ?d)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )

  ;; Move a disk from a disk to an empty peg
  (:action move-disk-to-peg-by-a1
    :parameters (?ag - agent ?d - disk ?from - disk ?to - peg ?p - phase ?pnext - phase)
    :precondition (and
      (agent ?ag)
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
      (current-phase ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (empty ?to))
      (clear ?d)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )

  ;; Move a disk from a disk to another (clear) disk (respecting sizes)
  (:action move-disk-to-disk-by-a1
    :parameters (?ag - agent ?d - disk ?from - disk ?to - disk ?p - phase ?pnext - phase)
    :precondition (and
      (agent ?ag)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current-phase ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )

  ;; ---------- Actions for agent a2 (distinct action names but same semantics) ----------
  (:action move-peg-to-peg-by-a2
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?p - phase ?pnext - phase)
    :precondition (and
      (agent ?ag)
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
      (current-phase ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (empty ?from)
      (not (empty ?to))
      (clear ?d)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )

  (:action move-peg-to-disk-by-a2
    :parameters (?ag - agent ?d - disk ?from - peg ?to - disk ?p - phase ?pnext - phase)
    :precondition (and
      (agent ?ag)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current-phase ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (empty ?from)
      (not (clear ?to))
      (clear ?d)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )

  (:action move-disk-to-peg-by-a2
    :parameters (?ag - agent ?d - disk ?from - disk ?to - peg ?p - phase ?pnext - phase)
    :precondition (and
      (agent ?ag)
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
      (current-phase ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (empty ?to))
      (clear ?d)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )

  (:action move-disk-to-disk-by-a2
    :parameters (?ag - agent ?d - disk ?from - disk ?to - disk ?p - phase ?pnext - phase)
    :precondition (and
      (agent ?ag)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current-phase ?p)
      (next ?p ?pnext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )
)