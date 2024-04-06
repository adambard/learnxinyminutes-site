
for i=0 to n-1
    dp[i]=0
    for j=0 to i-1
        if (a[i] >  a[j] and dp[i]<dp[j])
            LS[i] = LS[j]
	dp[i]=dp[i]+1
for i=0 to n-1
    if (largest < dp[i])
		largest = dp[i]

