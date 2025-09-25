(define (domain meeting-orchestration)
  (:requirements :strips)
  (:predicates
    (succ ?s ?s2)
    (agent-at ?a ?loc ?s)
    (travel-plan ?a ?from ?to ?dep ?arr)
    (available-for-meeting ?a ?start)
    (meeting-held)
  )

  ;; Alice waits one slot at her current location
  (:action wait_alice
    :parameters (?loc ?s1 ?s2)
    :precondition (and (agent-at alice ?loc ?s1) (succ ?s1 ?s2))
    :effect (and (not (agent-at alice ?loc ?s1)) (agent-at alice ?loc ?s2))
  )

  ;; Bob waits one slot at his current location
  (:action wait_bob
    :parameters (?loc ?s1 ?s2)
    :precondition (and (agent-at bob ?loc ?s1) (succ ?s1 ?s2))
    :effect (and (not (agent-at bob ?loc ?s1)) (agent-at bob ?loc ?s2))
  )

  ;; Generic travel action for Alice using precomputed travel-plan facts
  (:action travel_alice
    :parameters (?from ?to ?dep ?arr)
    :precondition (and (agent-at alice ?from ?dep) (travel-plan alice ?from ?to ?dep ?arr))
    :effect (and (not (agent-at alice ?from ?dep)) (agent-at alice ?to ?arr))
  )

  ;; Generic travel action for Bob using precomputed travel-plan facts
  (:action travel_bob
    :parameters (?from ?to ?dep ?arr)
    :precondition (and (agent-at bob ?from ?dep) (travel-plan bob ?from ?to ?dep ?arr))
    :effect (and (not (agent-at bob ?from ?dep)) (agent-at bob ?to ?arr))
  )

  ;; Joint meeting action: requires Alice, Bob and Joseph to be at the office
  ;; for the entire meeting interval (15 slots = 75 minutes at 5-minute granularity).
  ;; The action enforces presence at start and every successor slot up to +14.
  (:action meet_alice_bob_with_joseph
    :parameters (?start
                 ?s1 ?s2 ?s3 ?s4 ?s5 ?s6 ?s7 ?s8 ?s9 ?s10 ?s11 ?s12 ?s13 ?s14)
    :precondition (and
      ;; availability for the entire meeting interval (precomputed)
      (available-for-meeting alice ?start)
      (available-for-meeting bob ?start)
      (available-for-meeting joseph ?start)

      ;; successor chain tying the 15 consecutive slots together
      (succ ?start ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4)
      (succ ?s4 ?s5) (succ ?s5 ?s6) (succ ?s6 ?s7) (succ ?s7 ?s8)
      (succ ?s8 ?s9) (succ ?s9 ?s10) (succ ?s10 ?s11) (succ ?s11 ?s12)
      (succ ?s12 ?s13) (succ ?s13 ?s14)

      ;; Alice is at the office for every slot in the interval
      (agent-at alice office ?start) (agent-at alice office ?s1) (agent-at alice office ?s2)
      (agent-at alice office ?s3) (agent-at alice office ?s4) (agent-at alice office ?s5)
      (agent-at alice office ?s6) (agent-at alice office ?s7) (agent-at alice office ?s8)
      (agent-at alice office ?s9) (agent-at alice office ?s10) (agent-at alice office ?s11)
      (agent-at alice office ?s12) (agent-at alice office ?s13) (agent-at alice office ?s14)

      ;; Bob is at the office for every slot in the interval
      (agent-at bob office ?start) (agent-at bob office ?s1) (agent-at bob office ?s2)
      (agent-at bob office ?s3) (agent-at bob office ?s4) (agent-at bob office ?s5)
      (agent-at bob office ?s6) (agent-at bob office ?s7) (agent-at bob office ?s8)
      (agent-at bob office ?s9) (agent-at bob office ?s10) (agent-at bob office ?s11)
      (agent-at bob office ?s12) (agent-at bob office ?s13) (agent-at bob office ?s14)

      ;; Joseph is at the office for every slot in the interval
      (agent-at joseph office ?start) (agent-at joseph office ?s1) (agent-at joseph office ?s2)
      (agent-at joseph office ?s3) (agent-at joseph office ?s4) (agent-at joseph office ?s5)
      (agent-at joseph office ?s6) (agent-at joseph office ?s7) (agent-at joseph office ?s8)
      (agent-at joseph office ?s9) (agent-at joseph office ?s10) (agent-at joseph office ?s11)
      (agent-at joseph office ?s12) (agent-at joseph office ?s13) (agent-at joseph office ?s14)
    )
    :effect (meeting-held)
  )
)