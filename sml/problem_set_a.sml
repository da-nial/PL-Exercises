fun is_older(date_1: int * int * int, date_2: int * int * int) =
    let
        val year_1 = #1(date_1)
        val month_1 = #2(date_1)
        val day_1 = #3(date_1)
        val year_2 = #1(date_2)
        val month_2 = #2(date_2)
        val day_2 = #3(date_2)
    in
        if year_1 < year_2
        then true
        else if year_1 > year_2 then false
        else
            if  month_1 < month_2
            then true
            else if month_1 > month_2 then false
            else
                if day_1 < day_2
                then true
                else false
    end

fun number_in_month(dates: (int * int * int) list, target_month) =
    if null(dates)
    then 0
    else
        let
            val hd_date_month = #2(hd(dates))
            val does_hd_date_match = (hd_date_month = target_month)
            val num_new_dates_matched = if does_hd_date_match then 1 else 0
        in
            num_new_dates_matched + number_in_month(tl(dates), target_month)
        end

fun number_in_months(
    dates: (int * int * int) list, target_months: int list
    ) =
    if null(target_months)
    then 0
    else
        let
            val current_target_month = hd(target_months)
            val num_new_dates_matched = number_in_month(dates, current_target_month)
        in
            num_new_dates_matched + number_in_months(dates, tl(target_months))
        end

fun dates_in_month(dates: (int * int * int) list, target_month: int) =
    if null(dates)
    then []
    else
        let
            val hd_date_month = #2(hd(dates))
            val does_hd_date_match = (hd_date_month = target_month)
        in
            if does_hd_date_match = true
            then hd(dates)::dates_in_month(tl(dates), target_month)
            else dates_in_month(tl(dates), target_month)
        end

fun dates_in_months(
    dates: (int * int * int) list, target_months: int list
    ) =
    if null(target_months)
    then []
    else
        let
            val current_target_month = hd(target_months)
            val dates_matched_current_target_month = dates_in_month(dates, current_target_month)
        in
            dates_matched_current_target_month@dates_in_months(dates, tl(target_months))
        end

fun get_nth(texts: string list, n: int) =
    if n = 1
    then hd(texts)
    else get_nth(tl(texts), n-1)

fun date_to_string(date: int * int * int) =
    let
        val month_titles = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        val year = Int.toString(#1(date))
        val month = get_nth(month_titles, #2(date))
        val day = Int.toString(#3(date))
    in
        month ^ " " ^ day ^ ", " ^ year
    end

fun number_before_reaching_sum(sum: int, numbers: int list) =
    if hd(numbers) < sum
    then 1 + number_before_reaching_sum(
        sum-hd(numbers), tl(numbers)
        )
    else 0

fun what_month(day: int) =
    let
        val months_number_of_days = [
            31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
        ]
    in
        1 + number_before_reaching_sum(day, months_number_of_days)
    end

fun month_range(day1: int, day2: int) =
    if day1 > day2
    then []
    else
        let
            val day1_month = what_month(day1)
        in
            day1_month::month_range(day1+1, day2)
        end

fun oldest(dates: (int * int * int) list) =
    if null(dates)
    then NONE
    else
        let
            val head_date = hd(dates);
            val max_tails = oldest(tl(dates))
        in
            if isSome(max_tails) andalso is_older(valOf(max_tails), head_date)
            then max_tails
            else SOME(head_date)
        end

fun remove_number(numbers: int list, target_number) =
    if null(numbers)
    then numbers
    else
    if hd(numbers) = target_number
    then remove_number(tl(numbers), target_number)
    else hd(numbers)::remove_number(tl(numbers), target_number)

fun remove_duplicates(numbers: int list) =
    if null(numbers)
    then numbers
    else
        hd(numbers)::remove_duplicates(
            remove_number(tl(numbers), hd(numbers))
            )

fun number_in_months_challenge(
    dates: (int * int * int) list, target_months: int list
    ) =
    number_in_months(
        dates, remove_duplicates(target_months)
        )

fun dates_in_months_challenge(
    dates: (int * int * int) list, target_months: int list
    ) =
    dates_in_months(
        dates, remove_duplicates(target_months)
        )

fun reasonable_date(date: int * int * int) =
    let
        val year = #1(date)
        val month = #2(date)
        val day = #3(date)

        val is_date_leap_year =
            if (year mod 4) <> 0 then false
            else
                if (year mod 100) <> 0 then true
                else (year mod 400) = 0

        val is_year_reasonable = (year > 0)
        val is_month_is_reasonable = (month >= 1) andalso (month <= 12);

        fun get_nth(numbers: int list, n: int) =
            if n = 1 then hd(numbers)
            else get_nth(tl(numbers), n-1)

        fun get_month_num_days() =
            let
                val normal_year_month_num_days = [
                            31, 28, 31,
                             30, 31, 30,
                              31, 31, 30,
                               31, 30, 31
                        ]
                val leap_year_month_num_days = [
                            31, 29, 31,
                             30, 31, 30,
                              31, 31, 30,
                               31, 30, 31
                ]
            in
                if is_date_leap_year
                    then get_nth(leap_year_month_num_days, month)
                else
                    get_nth(normal_year_month_num_days, month)
            end

        fun is_day_reasonable() =
            day >= 1 andalso day <= get_month_num_days()
    in
        is_year_reasonable andalso is_month_is_reasonable andalso is_day_reasonable()
    end
