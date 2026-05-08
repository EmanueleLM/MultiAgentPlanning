```pddl
(define (problem trip-9day-plan)
    (:domain trip-planning-9day)
    (:objects
        Brussels Valencia Nice - city
        D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 - day ; D1 to D10 defines 9 transitions (days)
        C0 C1 C2 C3 C4 C5 C6 - count       ; Counts up to 6 for Nice
    )

    (:init
        ;; Connectivity: B <-> V, B <-> N
        (direct-flight Brussels Valencia)
        (direct-flight Valencia Brussels)
        (direct-flight Nice Brussels)
        (direct-flight Brussels Nice)

        ;; Temporal Ordering
        (next-day D1 D2) (next-day D2 D3) (next-day D3 D4)
        (next-day D4 D5) (next-day D5 D6) (next-day D6 D7)
        (next-day D7 D8) (next-day D8 D9) (next-day D9 D10)
        (current-day D1)

        ;; Count progression
        (next-count C0 C1) (next-count C1 C2) (next-count C2 C3)
        (next-count C3 C4) (next-count C4 C5) (next-count C5 C6)

        ;; Stay initial counts (0 days spent everywhere)
        (stay-b C0)
        (stay-v C0)
        (stay-n C0)
        
        ;; Initial State (Starting in Brussels)
        (at Brussels)
        (visited Brussels) 
        (not (nice-meeting-held))
    )

    (:goal
        (and
            (current-day D10) ; Total 9 days elapsed
            (visited Brussels)
            (visited Valencia)
            (visited Nice)
            (nice-meeting-held)
            
            ;; Enforce adjusted stay requirements fitting the 9-day limit: N=6, B=2, V=1
            (stay-b C2) ; Brussels: 2 days
            (stay-v C1) ; Valencia: 1 day
            (stay-n C6) ; Nice: 6 days
        )
    )
)
```