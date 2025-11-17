(define (domain object-manipulation)
  ;; Assumptions resolved per auditor recommendations:
  ;; - Two agent name prefixes chosen: agentA_ (for paltry, sip, clip) and agentB_ (for wretched, memory, tightfisted).
  ;; - Reservation tokens and a hand resource token are introduced as recommended by the auditor:
  ;;   orchestrator_claim_next / reserved_next and free_hand predicates are used to avoid unsafe deletions.
  ;; - Parameter distinctness constraints are enforced using negative equality preconditions where semantics imply distinct objects.
  ;; Remaining assumptions:
  ;; - Predicate arities and semantics follow the auditor's interpretation: hand/cats/texture/sneeze/spring/stupendous are unary; next/vase/collect/reserved_next are binary relations.
  ;; - The acting entity is the object with the hand(...) predicate; actions that require a hand consume/re-produce free_hand(...) to ensure exclusivity.
  ;; - All reservation/hand tokens are modeled as explicit predicates; no other implicit resources or side-effects exist.
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (free_hand ?o - obj)             ; token indicating the hand resource is free
    (reserved_next ?a - obj ?b - obj) ; claim token for next(a,b)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (vase ?a - obj ?b - obj)
  )

  ;; Orchestrator claim action to reserve a next-edge before actions that will delete it.
  (:action orchestrator_claim_next
    :parameters (?a - obj ?b - obj)
    :precondition (and
                    (next ?a ?b)
                    (not (reserved_next ?a ?b))
                  )
    :effect (and
              (reserved_next ?a ?b)
            )
  )

  ;; Orchestrator optional release (can be used to clear an unused reservation).
  (:action orchestrator_release_next
    :parameters (?a - obj ?b - obj)
    :precondition (and
                    (reserved_next ?a ?b)
                  )
    :effect (and
              (not (reserved_next ?a ?b))
            )
  )

  ;; Agent A actions (paltry, sip, clip) — prefixed with agentA_
  ;; agentA_clip: split into claim (orchestrator_claim_next) + commit here.
  (:action agentA_clip_commit
    :parameters (?hand - obj ?sneezeSub - obj ?tex - obj)
    :precondition (and
                    (free_hand ?hand)
                    (sneeze ?sneezeSub)
                    (texture ?tex)
                    (next ?sneezeSub ?tex)
                    (reserved_next ?hand ?tex)
                    (not (vase ?hand ?sneezeSub))
                    ;; distinctness constraints
                    (not (= ?hand ?sneezeSub))
                    (not (= ?hand ?tex))
                    (not (= ?sneezeSub ?tex))
                  )
    :effect (and
              ;; consume and re-provide the hand token to model exclusive use
              (not (free_hand ?hand))
              (free_hand ?hand)
              ;; create vase relation and delete the actor's next edge (commit)
              (vase ?hand ?sneezeSub)
              (not (next ?hand ?tex))
              ;; clear reservation
              (not (reserved_next ?hand ?tex))
            )
  )

  (:action agentA_sip_commit
    :parameters (?hand - obj ?cat - obj ?tex - obj)
    :precondition (and
                    (free_hand ?hand)
                    (cats ?cat)
                    (texture ?tex)
                    (next ?cat ?tex)
                    (reserved_next ?hand ?tex)
                    (not (vase ?hand ?cat))
                    ;; distinctness
                    (not (= ?hand ?cat))
                    (not (= ?hand ?tex))
                    (not (= ?cat ?tex))
                  )
    :effect (and
              (not (free_hand ?hand))
              (free_hand ?hand)
              (vase ?hand ?cat)
              (not (next ?hand ?tex))
              (not (reserved_next ?hand ?tex))
            )
  )

  (:action agentA_paltry
    :parameters (?hand - obj ?cat - obj ?tex - obj)
    :precondition (and
                    (free_hand ?hand)
                    (cats ?cat)
                    (texture ?tex)
                    (vase ?hand ?cat)
                    (next ?cat ?tex)
                    ;; avoid redundant creation
                    (not (next ?hand ?tex))
                    ;; distinctness
                    (not (= ?hand ?cat))
                    (not (= ?hand ?tex))
                    (not (= ?cat ?tex))
                  )
    :effect (and
              (not (free_hand ?hand))
              (free_hand ?hand)
              (next ?hand ?tex)
              (not (vase ?hand ?cat))
            )
  )

  ;; Agent B actions (wretched, memory, tightfisted) — prefixed with agentB_
  ;; wretched moves next(A,B) to next(A,C) and deletes the original: requires reservation.
  (:action agentB_wretched_commit
    :parameters (?A - obj ?B - obj ?C - obj ?D - obj)
    :precondition (and
                    (sneeze ?A)
                    (texture ?B)
                    (texture ?C)
                    (stupendous ?D)
                    (next ?A ?B)
                    (collect ?B ?D)
                    (collect ?C ?D)
                    (reserved_next ?A ?B)
                    ;; avoid redundant recreation
                    (not (next ?A ?C))
                    ;; distinctness (practical)
                    (not (= ?A ?B))
                    (not (= ?A ?C))
                    (not (= ?B ?C))
                  )
    :effect (and
              (next ?A ?C)
              (not (next ?A ?B))
              (not (reserved_next ?A ?B))
            )
  )

  (:action agentB_memory_commit
    :parameters (?X - obj ?Y - obj ?Z - obj)
    :precondition (and
                    (cats ?X)
                    (spring ?Y)
                    (spring ?Z)
                    (next ?X ?Y)
                    (reserved_next ?X ?Y)
                    (not (next ?X ?Z))
                    ;; distinctness
                    (not (= ?X ?Y))
                    (not (= ?X ?Z))
                    (not (= ?Y ?Z))
                  )
    :effect (and
              (next ?X ?Z)
              (not (next ?X ?Y))
              (not (reserved_next ?X ?Y))
            )
  )

  (:action agentB_tightfisted
    :parameters (?H - obj ?S - obj ?T - obj)
    :precondition (and
                    (free_hand ?H)
                    (sneeze ?S)
                    (texture ?T)
                    (next ?S ?T)
                    (vase ?H ?S)
                    ;; prevent duplicate next link
                    (not (next ?H ?T))
                    ;; distinctness
                    (not (= ?H ?S))
                    (not (= ?H ?T))
                    (not (= ?S ?T))
                  )
    :effect (and
              (not (free_hand ?H))
              (free_hand ?H)
              (next ?H ?T)
              (not (vase ?H ?S))
            )
  )
)