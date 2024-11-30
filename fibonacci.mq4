//+------------------------------------------------------------------+
//| Expert initialization function                                     |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Initialization code here
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                   |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   // Cleanup code here
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   double ma30 = iMA(NULL, 0, 30, 0, MODE_SMA, PRICE_CLOSE, 0);
   double ma50 = iMA(NULL, 0, 50, 0, MODE_SMA, PRICE_CLOSE, 0);
   double ma30_prev = iMA(NULL, 0, 30, 0, MODE_SMA, PRICE_CLOSE, 1);
   double ma50_prev = iMA(NULL, 0, 50, 0, MODE_SMA, PRICE_CLOSE, 1);

   // Check for crossover
   if (ma30_prev > ma50_prev && ma30 <= ma50) // 30 crosses below 50
     {
      // Place a sell order
      double lotSize = 0.1; // Adjust lot size as necessary
      double slippage = 3;
      int ticket = OrderSend(Symbol(), OP_SELL, lotSize, Bid, slippage, 0, 0, "MA Crossover Sell", 0, 0, clrRed);
      if (ticket < 0)
        {
         Print("Error in OrderSend: ", GetLastError());
        }
     }
  }
//+------------------------------------------------------------------+