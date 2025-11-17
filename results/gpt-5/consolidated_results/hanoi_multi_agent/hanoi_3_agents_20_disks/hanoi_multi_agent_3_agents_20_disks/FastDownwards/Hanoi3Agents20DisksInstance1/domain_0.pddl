(define (domain hanoi-20-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg)
  (:predicates
    ; placement and stack structure
    (on ?d - disk ?p - peg)                  ; disk d is on peg p
    (support ?d - disk ?p - peg)             ; disk d is directly supported by peg p (i.e., bottom disk on that peg)
    (below ?d1 - disk ?d2 - disk)            ; d1 is immediately above d2 (both on the same peg)

    ; peg and disk status
    (clear ?p - peg)                         ; peg p has no disks
    (top ?d - disk)                          ; no disk is on top of d

    ; size ordering and agent control
    (smaller ?d1 - disk ?d2 - disk)          ; d1 is smaller than d2
    (controls ?a - agent ?d - disk)          ; agent a is allowed to move disk d

    ; audited step control to enforce the given ordered sequence
    (step0)
    (step1)
    (step2)
    (step3)
  )

  ; Audited, strictly-ordered moves that must occur first (in order):
  ; 1) agent_1: A from left to right
  (:action audited-move-1-A-left-to-right
    :parameters (?a - agent)
    :precondition (and
      (step0)
      (controls ?a A)
      (top A)
      (on A left)
      (below A B)
      (clear right)
    )
    :effect (and
      (not (step0))
      (step1)
      ; move A: left -> right (onto empty right)
      (not (on A left))
      (on A right)
      (support A right)
      (not (below A B))
      (top B)
      (not (clear right))
    )
  )

  ; 2) agent_1: B from left to middle
  (:action audited-move-2-B-left-to-middle
    :parameters (?a - agent)
    :precondition (and
      (step1)
      (controls ?a B)
      (top B)
      (on B left)
      (below B C)
      (clear middle)
    )
    :effect (and
      (not (step1))
      (step2)
      ; move B: left -> middle (onto empty middle)
      (not (on B left))
      (on B middle)
      (support B middle)
      (not (below B C))
      (top C)
      (not (clear middle))
    )
  )

  ; 3) agent_1: A from right to middle (onto B)
  (:action audited-move-3-A-right-to-middle-onto-B
    :parameters (?a - agent)
    :precondition (and
      (step2)
      (controls ?a A)
      (top A)
      (on A right)
      (support A right)
      (top B)
      (on B middle)
      (smaller A B)
    )
    :effect (and
      (not (step2))
      (step3)
      ; move A: right -> middle (onto B)
      (not (on A right))
      (on A middle)
      (not (support A right))
      (below A B)
      (not (top B))
      (clear right)
    )
  )

  ; General moves are only permitted after the audited sequence completes (step3):

  ; Move a top disk x (that sits on some disk u) from peg p to the top of disk y on peg q
  (:action move
    :parameters (?a - agent ?x - disk ?u - disk ?y - disk ?p - peg ?q - peg)
    :precondition (and
      (step3)
      (controls ?a ?x)
      (on ?x ?p)
      (below ?x ?u)
      (top ?x)
      (top ?y)
      (on ?y ?q)
      (smaller ?x ?y)
    )
    :effect (and
      (not (on ?x ?p))
      (on ?x ?q)
      (not (below ?x ?u))
      (below ?x ?y)
      (top ?u)
      (not (top ?y))
    )
  )

  ; Move a top bottom-disk x (directly supported by peg p) onto the top of disk y on peg q
  (:action move-from-peg-to-disk
    :parameters (?a - agent ?x - disk ?y - disk ?p - peg ?q - peg)
    :precondition (and
      (step3)
      (controls ?a ?x)
      (on ?x ?p)
      (support ?x ?p)
      (top ?x)
      (top ?y)
      (on ?y ?q)
      (smaller ?x ?y)
    )
    :effect (and
      (not (on ?x ?p))
      (on ?x ?q)
      (not (support ?x ?p))
      (below ?x ?y)
      (not (top ?y))
      (clear ?p)
    )
  )

  ; Move a top disk x (on disk u) from peg p to an empty peg q
  (:action move-to-empty
    :parameters (?a - agent ?x - disk ?u - disk ?p - peg ?q - peg)
    :precondition (and
      (step3)
      (controls ?a ?x)
      (on ?x ?p)
      (below ?x ?u)
      (top ?x)
      (clear ?q)
    )
    :effect (and
      (not (on ?x ?p))
      (on ?x ?q)
      (not (below ?x ?u))
      (support ?x ?q)
      (top ?u)
      (not (clear ?q))
    )
  )

  ; Move a top bottom-disk x (supported by peg p) to an empty peg q
  (:action move-peg-to-empty
    :parameters (?a - agent ?x - disk ?p - peg ?q - peg)
    :precondition (and
      (step3)
      (controls ?a ?x)
      (on ?x ?p)
      (support ?x ?p)
      (top ?x)
      (clear ?q)
    )
    :effect (and
      (not (on ?x ?p))
      (on ?x ?q)
      (not (support ?x ?p))
      (support ?x ?q)
      (clear ?p)
      (not (clear ?q))
    )
  )
)