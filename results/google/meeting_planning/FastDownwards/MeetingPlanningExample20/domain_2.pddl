(define (domain meeting-orchestration)
  (:requirements :strips)
  (:predicates
    (succ ?s ?s2)
    (agent-at ?a ?loc ?s)
    (travel-plan ?a ?from ?to ?dep ?arr)
    (available-for-meeting ?a ?start)
    (meeting-held)
  )

  (:action wait
    :parameters (?a ?loc ?s1 ?s2)
    :precondition (and (agent-at ?a ?loc ?s1) (succ ?s1 ?s2))
    :effect (and (not (agent-at ?a ?loc ?s1)) (agent-at ?a ?loc ?s2))
  )

  (:action travel
    :parameters (?a ?from ?to ?dep ?arr)
    :precondition (and (agent-at ?a ?from ?dep) (travel-plan ?a ?from ?to ?dep ?arr))
    :effect (and (not (agent-at ?a ?from ?dep)) (agent-at ?a ?to ?arr))
  )

  (:action meet
    :parameters (?a1 ?a2 ?a3 ?loc ?start
                 ?s1 ?s2 ?s3 ?s4 ?s5 ?s6 ?s7 ?s8 ?s9 ?s10 ?s11 ?s12 ?s13 ?s14)
    :precondition (and
      (available-for-meeting ?a1 ?start)
      (available-for-meeting ?a2 ?start)
      (available-for-meeting ?a3 ?start)

      (succ ?start ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4)
      (succ ?s4 ?s5) (succ ?s5 ?s6) (succ ?s6 ?s7) (succ ?s7 ?s8)
      (succ ?s8 ?s9) (succ ?s9 ?s10) (succ ?s10 ?s11) (succ ?s11 ?s12)
      (succ ?s12 ?s13) (succ ?s13 ?s14)

      (agent-at ?a1 ?loc ?start) (agent-at ?a1 ?loc ?s1) (agent-at ?a1 ?loc ?s2)
      (agent-at ?a1 ?loc ?s3) (agent-at ?a1 ?loc ?s4) (agent-at ?a1 ?loc ?s5)
      (agent-at ?a1 ?loc ?s6) (agent-at ?a1 ?loc ?s7) (agent-at ?a1 ?loc ?s8)
      (agent-at ?a1 ?loc ?s9) (agent-at ?a1 ?loc ?s10) (agent-at ?a1 ?loc ?s11)
      (agent-at ?a1 ?loc ?s12) (agent-at ?a1 ?loc ?s13) (agent-at ?a1 ?loc ?s14)

      (agent-at ?a2 ?loc ?start) (agent-at ?a2 ?loc ?s1) (agent-at ?a2 ?loc ?s2)
      (agent-at ?a2 ?loc ?s3) (agent-at ?a2 ?loc ?s4) (agent-at ?a2 ?loc ?s5)
      (agent-at ?a2 ?loc ?s6) (agent-at ?a2 ?loc ?s7) (agent-at ?a2 ?loc ?s8)
      (agent-at ?a2 ?loc ?s9) (agent-at ?a2 ?loc ?s10) (agent-at ?a2 ?loc ?s11)
      (agent-at ?a2 ?loc ?s12) (agent-at ?a2 ?loc ?s13) (agent-at ?a2 ?loc ?s14)

      (agent-at ?a3 ?loc ?start) (agent-at ?a3 ?loc ?s1) (agent-at ?a3 ?loc ?s2)
      (agent-at ?a3 ?loc ?s3) (agent-at ?a3 ?loc ?s4) (agent-at ?a3 ?loc ?s5)
      (agent-at ?a3 ?loc ?s6) (agent-at ?a3 ?loc ?s7) (agent-at ?a3 ?loc ?s8)
      (agent-at ?a3 ?loc ?s9) (agent-at ?a3 ?loc ?s10) (agent-at ?a3 ?loc ?s11)
      (agent-at ?a3 ?loc ?s12) (agent-at ?a3 ?loc ?s13) (agent-at ?a3 ?loc ?s14)
    )
    :effect (meeting-held)
  )
)